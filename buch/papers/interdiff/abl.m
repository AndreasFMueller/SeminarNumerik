#
# abl.m -- numersiche Experimente zur Ableitung
#
f = fopen("spectra.tex", "w");

a = zeros(1024,1);

a(1,1) = 1;
a(1024,1) = -1;

b1 = abs(fft(a));
b1 = shift(b1, 512);

fprintf(f, "\\def\\pathone{\n\\draw[line width=1.4pt] ({\\sx*%.5f},{\\sy*%.5f})", 0, b1(1,1));
for i = (2:1024)
	fprintf(f, "\n\t--({\\sx*%.5f},{\\sy*%.5f})", (i - 1)/1024, b1(i,1));
end
fprintf(f, ";\n}\n\n");

a(1,1) = 1125/1024;
a(2,1) = -245/3072;
a(3,1) = 49/5120;
a(4,1) = -5/7168;
for i = (1:4)
	a(1025-i,1) = -a(i,1);
end

b2 = abs(fft(a));
b2 = shift(b2, 512);

fprintf(f, "\\def\\pathtwo{\n\\draw[line width=1.4pt] ({\\sx*%.5f},{\\sy*%.5f})", 0, b2(1,1));
for i = (2:1024)
	fprintf(f, "\n\t--({\\sx*%.5f},{\\sy*%.5f})", (i - 1)/1024, b2(i,1));
end
fprintf(f, ";\n}\n\n");

delta = b1 - b2;

fprintf(f, "\\def\\pathdelta{\n\\draw[line width=1.4pt] ({\\sx*%.5f},{\\sy*%.5f})", 0, delta(1,1));
for i = (2:1024)
	fprintf(f, "\n\t--({\\sx*%.5f},{\\sy*%.5f})", (i - 1)/1024, delta(i,1));
end
fprintf(f, ";\n}\n\n");

fclose(f);
