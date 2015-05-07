## Makefile for lhef2hepmc
## Execute as 'make HEPMC_PREFIX=/path/to/hepmc', 'make test', 'make clean'

HEPMC_PREFIX=/home/dan-bia/workspace/HepMC-2.06.05

lhef2hepmc: lhef2hepmc.cc
	g++ lhef2hepmc.cc $(CXXFLAGS) $(CPPFLAGS) -O2 -I$(HEPMC_PREFIX)/include -I. $(LDFLAGS) -L$(HEPMC_PREFIX)/lib -lHepMC -o lhef2hepmc

test: lhef2hepmc
	rm -rf fifo.hepmc; mkfifo fifo.hepmc
	cat aaww_8tev_pythia.lhe | ./lhef2hepmc
	./lhef2hepmc  aaww_8tev_pythia.lhe  aaww_8tev_pythia.hepmc && rm test.hepmc
	./lhef2hepmc  aaww_8tev_pythia.lhe -
	which rivet && { ./lhef2hepmc  aaww_8tev_pythia.lhe fifo.hepmc & rivet -a MC_GENERIC fifo.hepmc;}

install: lhef2hepmc
	@test -d $(HEPMC_PREFIX)/bin && install lhef2hepmc $(HEPMC_PREFIX)/bin

clean:
	@rm -f lhef2hepmc test.hepmc fifo.hepmc Rivet.aida
