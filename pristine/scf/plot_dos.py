import numpy as np
import matplotlib.pyplot as plt
#Change the name of the file instead of X.dos.dat

for ws in [2]:		# This is the window size
    data = np.loadtxt('ZnS.dos', skiprows=1, dtype='float')

    mov_avg_up = []
    arr_up = data[:,1]
    mov_avg_dw = []
    arr_dw = data[:,2]

    i = 0
    while i < len(arr_up)-ws + 1:
        window = arr_up[i : i + ws]
        avg = sum(window)/ws
        mov_avg_up.append(avg)
        i += 1

    i = 0
    while i < len(arr_dw)-ws + 1:
        window = arr_dw[i : i + ws]
        avg = sum(window)/ws
        mov_avg_dw.append(-1*avg)
        i += 1
    my_dpi=99
    fig,ax = plt.subplots(figsize=(777/my_dpi,657/my_dpi), dpi=my_dpi)

    plt.xlabel("Energy (eV)", fontsize=30)
    plt.ylabel("DOS (states/eV)", fontsize=30)
    plt.ylim(-50,50)
    plt.xlim(-5	, 5)

    fermi=5.5451

    aaa = data[int(ws/2)-1:int(-1*ws/2),0]

    ax.plot(aaa-fermi, mov_avg_up, label="up spin", linewidth=2, color='green')
    ax.plot(aaa-fermi, mov_avg_dw, label="down spin", linewidth=2, color='red')

    plt.title("Pristine ZnS", fontsize=35)

    plt.fill_between(aaa-fermi,0,mov_avg_up,where=(aaa <fermi), facecolor='green', alpha=0.15)
    plt.fill_between(aaa-fermi,0,mov_avg_dw,where=(aaa <fermi), facecolor='red', alpha=0.15)

    plt.axvline(x=0, linewidth=0.5, color='k', linestyle=(0, (8, 10)))
    #plt.text(0.1, -55.7, 'Fermi energy', rotation=90, fontsize=20)
    plt.tight_layout()
    plt.xticks(fontsize=20)
    plt.yticks(fontsize=20)

    ax.legend(fontsize=20, loc=1)

plt.show()
