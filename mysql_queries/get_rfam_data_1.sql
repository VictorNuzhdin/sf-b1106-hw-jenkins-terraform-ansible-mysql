-- get publication data
--
SELECT  fr.rfam_acc, fr.rfamseq_acc,
	flr.pmid, flr.order_added,
	-- URLs
	concat("https://pubmed.ncbi.nlm.nih.gov/", lr.pmid, "/") as PUB_URL,
	-- Pub Source and Title
	lr.journal, lr.title

FROM    full_region fr, rfamseq rf, taxonomy tx,
	-- publication link by PMID
	family_literature_reference flr,
	-- publication info
	literature_reference lr
WHERE
	rf.ncbi_id = tx.ncbi_id and fr.rfam_acc = flr.rfam_acc and flr.pmid = lr.pmid
	AND fr.rfamseq_acc = rf.rfamseq_acc
	AND tx.ncbi_id = 227859 -- NCBI taxonomy id of "SARS coronavirus"               -- 7 records total
	AND is_significant = 1  -- exclude low-scoring matches from the same clan       -- 3 records of 7
ORDER BY
	fr.rfam_acc, fr.rfamseq_acc, flr.order_added
LIMIT 	1, 1;

/**OUTPUT:

RFAM_ACC    RFAMSEQ_ACC     PMID    	ORDER_ADDED     PUB_URL 										JOURNAL 								TITLE
RF00507 	AY274119.3      15680415    1       		https://pubmed.ncbi.nlm.nih.gov/15680415/       Virology 2005;332:498-510.      		Programmed ribosomal frameshifting in decoding the SARS-CoV genome.
RF00507 	AY274119.3      32743589    2       		https://pubmed.ncbi.nlm.nih.gov/32743589/       bioRxiv. 2020; [Epub ahead of print]    Cryo-electron Microscopy and Exploratory Antisense Targeting of the 28-kDa Frameshift Stimulation Element from the SARS-CoV-2 RNA Genome.
RF03120 	AY274119.3      15220462    1       		https://pubmed.ncbi.nlm.nih.gov/15220462/       J Virol. 2004;78:7846-7851.     		The 3' cis-acting genomic replication element of the severe acute respiratory syndrome coronavirus can function in the murine coronavirus genome.
RF03120 	AY274119.3      25736566    2       		https://pubmed.ncbi.nlm.nih.gov/25736566/       Virus Res. 2015;206:120-133.    		The structure and functions of coronavirus genomic 3' and 5' ends.
RF03120 	AY274119.3      21378501    3       		https://pubmed.ncbi.nlm.nih.gov/21378501/       RNA Biol. 2011;8:237-248.       		RNA-RNA and RNA-protein interactions in coronavirus replication and transcription.
RF03120 	AY274119.3      27712622    4       		https://pubmed.ncbi.nlm.nih.gov/27712622/       Adv Virus Res. 2016;96:127-163. 		Coronavirus cis-Acting RNA Elements.
RF03120 	AY274119.3      35236777    5       		https://pubmed.ncbi.nlm.nih.gov/35236777/       RNA. 2022;28:729-741.   				Correlated sequence signatures are present within the genomic 5'UTR RNA and NSP1  protein in coronaviruses.
RF03125 	AY274119.3      15220462    1       		https://pubmed.ncbi.nlm.nih.gov/15220462/       J Virol. 2004;78:7846-7851.     		The 3' cis-acting genomic replication element of the severe acute respiratory syndrome coronavirus can function in the murine coronavirus genome.
RF03125 	AY274119.3      25736566    2       		https://pubmed.ncbi.nlm.nih.gov/25736566/       Virus Res. 2015;206:120-133.    		The structure and functions of coronavirus genomic 3' and 5' ends.
RF03125 	AY274119.3      21378501    3       		https://pubmed.ncbi.nlm.nih.gov/21378501/       RNA Biol. 2011;8:237-248.       		RNA-RNA and RNA-protein interactions in coronavirus replication and transcription.
RF03125 	AY274119.3      27712622    4       		https://pubmed.ncbi.nlm.nih.gov/27712622/       Adv Virus Res. 2016;96:127-163. 		Coronavirus cis-Acting RNA Elements.
*/
-- 11 records (total)
