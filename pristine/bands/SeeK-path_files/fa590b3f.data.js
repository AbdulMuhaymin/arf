"use strict";angular.module("data",[]).constant("DATA",{tools_menu:{menu:{main_tools:[{state_name:"main.work.tools.qeinputgenerator",title:"Quantum ESPRESSO input generator and structure visualizer",authors:"Elsa Passaro, Sebastiaan P. Huber, Giovanni Pizzi, Nicola Marzari",description:"A tool to generate the input file of the Quantum ESPRESSO PWscf code and to visualize the corresponding structure.\n",logo:"qe-logo.png"},{state_name:"main.work.tools.seekpath",title:"SeeK-path: the k-path finder and visualizer",authors:"Yoyo Hinuma, Giovanni Pizzi, Yu Kumagai, Fumiyasu Oba, Isao Tanaka",description:"A k-path finder that provides band paths compatible with space group symmetry, and an interactive 3D visualizer.\n",logo:"seekpath.png"},{link:"https://optimadeclient.materialscloud.io",title:"OPTIMADE-Client",authors:"Casper Welzel Andersen",description:"A friendly client to search through materials databases and other implementations exposing an OPTIMADE RESTful API.\n",logo:"optimade.png"},{link:"https://interactivephonon.materialscloud.io",title:"Interactive phonon visualizer",authors:"Snehal Kumbhar, Giovanni Pizzi, Thibault Sohier, Henrique Miranda",description:"A tool for the interactive visualization and inspection of lattice vibrations.\n",logo:"interactivephonon.png"}],contributed_tools:[{link:"https://cell2mol.materialscloud.io",title:"cell2mol: unit cell to molecule interpretation",authors:"O. Hernandez-Cuellar, Y. Cho, R. Laplaza, L. O. Marsh, S. Vela, C. Corminboeuf",description:"A tool to interpret crystallographic data and retrieve the connectivity, total charge, and spin of molecular complexes and their components including the oxidation state (OS) of metal atoms and the charge of ligands.\n",logo:"cell2mol.png",doi:"10.5281/zenodo.10204037"},{link:"https://ml-layer-finder.materialscloud.io",title:"Machine-learning accelerated identification of exfoliable two-dimensional materials",authors:"Mohammad Tohidi Vahdat, Kumar Agrawal Varoon, Giovanni Pizzi",description:"This tool allows users to upload the bulk crystal structure in several standard formats (or to choose from a few examples), and then layered structures are identified based on geometrical criteria. Finally, after generating feature vectors representing the crystal structure, the tool uses a machine learning model to see if the crystal structure can be exfoliated or have high binding energy.\n",logo:"ML-layer-finder-logo.png"},{state_name:"main.work.tools.tgkp",title:"Band structure of twisted mixed multilayer graphene in k • p model",authors:"Leo P. Goutte, Oleg V. Yazyev, QuanSheng Wu",description:"A tunable model for the energy spectrum of twisted mixed multilayer graphene.\n",logo:"tgkp.png"},{state_name:"main.work.tools.oximachine",doi:"10.24435/materialscloud:2018.0003/v3",title:"oxiMACHINE: Predicting oxidation states for MOFs",authors:"K. M. Jablonka, D. Ongari, S. M. Moosavi, B. Smit",description:"This tool takes a crystal structure and predicts the oxidation state for each metal site.\n",logo:"oximachine.png"},{link:"https://layer-raman-ir.materialscloud.io/",title:"Fan diagrams and optically-active modes of layered materials",authors:"G. Pizzi, S. Milana, A. C. Ferrari, N. Marzari, M. Gibertini",description:"A tool to upload the bulk crystal structure of a layered material and determine the symmetry of the inter-layer force-constant matrices and the corresponding optical-activity fan diagram.\n",logo:"layer-raman.png"},{link:"https://tbeta.materialscloud.io/voila/render/Tight-Binding%20Electronic%20Transport%20Application.ipynb",title:"Tight-Binding Electronic Transport Application (TBETA) for graphene nanoribbon junctions",authors:"Kristiāns Čerņevičs, Valeria Granata, Oleg V. Yazyev",description:"A tool for building and analyzing electronic transport properties of graphene nanoribbon junctions.\n",logo:"TBETA_logo.png",doi:"10.24435/materialscloud:av-24"},{state_name:"main.work.tools.sycofinder",doi:"10.5281/zenodo.1312814",title:"Synthesis condition finder",authors:"Seyed Mohamad Moosavi, Leopold Talirz, Berend Smit",description:"A tool for optimizing the experimental synthesis conditions for metal-organic frameworks using machine learning and genetic algorithms.\n",logo:"sycofinder.png"},{state_name:"main.work.tools.alphaml",title:"AlphaML: machine learning of molecular polarizabilities",authors:"David M. Wilkins, Andrea Grisafi, Yang Yang, Ka Un Lao, Robert A. DiStasio Jr., Michele Ceriotti",description:"A machine learning framework for the prediction of molecular polarizabilities based on comparisons of local environments.\n",logo:"alphaml.png"},{state_name:"main.work.tools.shiftml",title:"ShiftML: chemical shifts in molecular crystals by machine learning",authors:"Andrea Anelli, Félix Musil, Federico M. Paruzzo, Albert Hofstetter, Sandip De, Edgar Engel, Lyndon Emsley, Michele Ceriotti",description:"A machine learning model to predict the isotropic chemical shielding of molecular crystals containing H, C, N, O\nand S, including the uncertainty of the prediction, and an interactive 3D visualiser.\n",logo:"shiftml.png"}]}}});