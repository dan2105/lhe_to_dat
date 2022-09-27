# Conversion to les Houches event(.lhe) format to ASCII hepmc file.

This version is supposed to work only with the v.1.0 of .lhe file. However
if you are interested only on the 4-momenta of the particles, you can use:

sed -i 's+LesHouchesEvents version="3.0"+LesHouchesEvents version="1.0"+g' unweighted_events.lhe
