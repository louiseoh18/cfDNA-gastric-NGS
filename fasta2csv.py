from Bio import SeqIO
import csv
import sys

# Define input FASTA file and output CSV file
fasta_file = sys.argv[1]
csv_file = sys.argv[2]

# Open the CSV file for writing
with open(csv_file, 'w', newline='') as csvfile:
    csv_writer = csv.writer(csvfile)
   
    # Write the header row
    csv_writer.writerow(['Sequence ID', 'Description', 'Sequence'])
   
    # Parse the FASTA file and write to CSV
    for record in SeqIO.parse(fasta_file, "fasta"):
        csv_writer.writerow([record.id, record.description, str(record.seq)])

print(f"Conversion complete! Data has been saved to {csv_file}.")