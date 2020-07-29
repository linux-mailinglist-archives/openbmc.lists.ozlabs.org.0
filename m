Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 368A823281B
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 01:31:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH8vW3mtnzDqnF
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 09:31:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH8qj4N31zDqj1
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 09:28:31 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TN1uQM093856
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 19:28:25 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32kgqsb1a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 19:28:24 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 29 Jul 2020 23:28:23 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.48) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 29 Jul 2020 23:28:21 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020072923282091-862683 ;
 Wed, 29 Jul 2020 23:28:20 +0000 
In-Reply-To: <20200729204528.15157-7-eajames@linux.ibm.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Eddie James <eajames@linux.ibm.com>
Date: Wed, 29 Jul 2020 23:28:20 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20200729204528.15157-7-eajames@linux.ibm.com>,
 <20200729204528.15157-1-eajames@linux.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 57339
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20072923-1429-0000-0000-0000026277DB
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00013559; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01412985; UDB=6.00757414; IPR=6.01195259; 
 MB=3.00033257; MTD=3.00000008; XFM=3.00000015; UTC=2020-07-29 23:28:22
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-07-29 22:14:39 - 6.00011660
x-cbparentid: 20072923-1430-0000-0000-000037D787E1
Message-Id: <OFA3969535.C7D0B012-ON002585B4.007F950A-002585B4.0080EFFD@notes.na.collabserv.com>
Subject: Re: [PATCH linux dev-5.7 6/6] eeprom: at25: Split reads into chunks
 and cap write size
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_14:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On July 20,2020 Eddie James wrote:
>From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
>Make use of spi=5Fmax=5Ftransfer=5Fsize to avoid requesting transfers that
>are
>too large for some spi controllers.
>
>Signed-off-by: Eddie James <eajames@linux.ibm.com>
>Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

When forwarding patches from others your SOB goes after theirs.


>---> drivers/misc/eeprom/at25.c | 94
>++++++++++++++++++++++----------------
> 1 file changed, 54 insertions(+), 40 deletions(-)
>
>diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
>index cde9a2fc1325..3ed041cb3083 100644
>--- a/drivers/misc/eeprom/at25.c
>+++ b/drivers/misc/eeprom/at25.c
>@@ -64,12 +64,17 @@ static int at25=5Fee=5Fread(void *priv, unsigned int
>offset,
> {
> 	struct at25=5Fdata *at25 =3D priv;
> 	char *buf =3D val;
>+	size=5Ft max=5Fchunk =3D spi=5Fmax=5Ftransfer=5Fsize(at25->spi);
>+	size=5Ft num=5Fmsgs =3D count / max=5Fchunk + (bool)(count % max=5Fchunk=
);

Casting to bool to use result as 1 or 0 ?  Obsfucated.

Use DIV=5FROUND=5FUP instead.

>+	size=5Ft			nr=5Fbytes =3D 0;> 	u8			command[EE=5FMAXADDRLEN + 1];
> 	u8			*cp;
> 	ssize=5Ft			status;
> 	struct spi=5Ftransfer	t[2];
> 	struct spi=5Fmessage	m;
> 	u8			instr;
>+	unsigned		msg=5Foffset;

I expect checkpatch to complain
# check for declarations of signed or unsigned without int
=09

>+	size=5Ft			msg=5Fcount;>=20
> 	if (unlikely(offset >=3D at25->chip.byte=5Flen))
> 		return -EINVAL;
>@@ -78,57 +83,64 @@ static int at25=5Fee=5Fread(void *priv, unsigned int
>offset,
> 	if (unlikely(!count))
> 		return -EINVAL;
>=20
>-	cp =3D command;
>-
>-	instr =3D AT25=5FREAD;
>-	if (at25->chip.flags & EE=5FINSTR=5FBIT3=5FIS=5FADDR)
>-		if (offset >=3D (1U << (at25->addrlen * 8)))
>-			instr |=3D AT25=5FINSTR=5FBIT3;
>-	*cp++ =3D instr;
>-
>-	/* 8/16/24-bit address is written MSB first */
>-	switch (at25->addrlen) {
>-	default:	/* case 3 */
>-		*cp++ =3D offset >> 16;
>-		/* fall through */
>-	case 2:
>-		*cp++ =3D offset >> 8;
>-		/* fall through */
>-	case 1:
>-	case 0:	/* can't happen: for better codegen */
>-		*cp++ =3D offset >> 0;
>-	}
>+	msg=5Foffset =3D (unsigned) offset;
>+	msg=5Fcount =3D min(count, max=5Fchunk);
>+	while (num=5Fmsgs) {
>+		cp =3D command;
>=20
>-	spi=5Fmessage=5Finit(&m);
>-	memset(t, 0, sizeof(t));
>+		instr =3D AT25=5FREAD;
>+		if (at25->chip.flags & EE=5FINSTR=5FBIT3=5FIS=5FADDR)
>+			if (msg=5Foffset >=3D (1U << (at25->addrlen * 8)))
>+				instr |=3D AT25=5FINSTR=5FBIT3;
>+		*cp++ =3D instr;
>=20
>-	t[0].tx=5Fbuf =3D command;
>-	t[0].len =3D at25->addrlen + 1;
>-	spi=5Fmessage=5Fadd=5Ftail(&t[0], &m);
>+		/* 8/16/24-bit address is written MSB first */
>+		switch (at25->addrlen) {
>+			default:	/* case 3 */
>+				*cp++ =3D msg=5Foffset >> 16;
>+				/* fall through */
>+			case 2:
>+				*cp++ =3D msg=5Foffset >> 8;
>+				/* fall through */
>+			case 1:
>+			case 0:	/* can't happen: for better codegen */
>+				*cp++ =3D msg=5Foffset >> 0;
>+		}
>=20
>-	t[1].rx=5Fbuf =3D buf;
>-	t[1].len =3D count;
>-	spi=5Fmessage=5Fadd=5Ftail(&t[1], &m);
>+		spi=5Fmessage=5Finit(&m);
>+		memset(t, 0, sizeof(t));
>=20
>-	mutex=5Flock(&at25->lock);
>+		t[0].tx=5Fbuf =3D command;
>+		t[0].len =3D at25->addrlen + 1;
>+		spi=5Fmessage=5Fadd=5Ftail(&t[0], &m);
>=20
>-	/* Read it all at once.
>-	 *
>-	 * REVISIT that's potentially a problem with large chips, if
>-	 * other devices on the bus need to be accessed regularly or
>-	 * this chip is clocked very slowly
>-	 */
>-	status =3D spi=5Fsync(at25->spi, &m);
>-	dev=5Fdbg(&at25->spi->dev, "read %zu bytes at %d --> %zd\n",
>-		count, offset, status);
>+		t[1].rx=5Fbuf =3D buf + nr=5Fbytes;
>+		t[1].len =3D msg=5Fcount;
>+		spi=5Fmessage=5Fadd=5Ftail(&t[1], &m);
>=20
>-	mutex=5Funlock(&at25->lock);
>-	return status;
>+		mutex=5Flock(&at25->lock);
>+
>+		status =3D spi=5Fsync(at25->spi, &m);
>+
>+		mutex=5Funlock(&at25->lock);
>+
>+		if (status)
>+			return status;
>+
>+		--num=5Fmsgs;
>+		msg=5Foffset +=3D msg=5Fcount;
>+		nr=5Fbytes +=3D msg=5Fcount;
>+	}
>+
>+	dev=5Fdbg(&at25->spi->dev, "read %zu bytes at %d\n",
>+				count, offset);
>+	return 0;
> }
>=20
> static int at25=5Fee=5Fwrite(void *priv, unsigned int off, void *val,
>size=5Ft count)
> {
> 	struct at25=5Fdata *at25 =3D priv;
>+	size=5Ft maxsz =3D spi=5Fmax=5Ftransfer=5Fsize(at25->spi);
> 	const char *buf =3D val;
> 	int			status =3D 0;
> 	unsigned		buf=5Fsize;
>@@ -191,6 +203,8 @@ static int at25=5Fee=5Fwrite(void *priv, unsigned int
>off, void *val, size=5Ft count)
> 		segment =3D buf=5Fsize - (offset % buf=5Fsize);
> 		if (segment > count)
> 			segment =3D count;
>+		if (segment > maxsz)
>+			segment =3D maxsz;
> 		memcpy(cp, buf, segment);
> 		status =3D spi=5Fwrite(at25->spi, bounce,
> 				segment + at25->addrlen + 1);
>--=20
>2.24.0
>
>

Regards,
milton

