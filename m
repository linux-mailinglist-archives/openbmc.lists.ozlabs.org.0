Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB4113568
	for <lists+openbmc@lfdr.de>; Sat,  4 May 2019 00:19:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wmld1xqCzDqYj
	for <lists+openbmc@lfdr.de>; Sat,  4 May 2019 08:19:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wmkp70c2zDqY2
 for <openbmc@lists.ozlabs.org>; Sat,  4 May 2019 08:19:14 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x43MC7qq066488
 for <openbmc@lists.ozlabs.org>; Fri, 3 May 2019 18:19:11 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.110])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s8w7aj869-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 03 May 2019 18:19:10 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 3 May 2019 22:19:10 -0000
Received: from us1b3-smtp04.a3dr.sjc01.isc4sb.com (10.122.203.161)
 by smtp.notes.na.collabserv.com (10.122.47.50) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 3 May 2019 22:19:06 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp04.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019050322190581-883449 ;
 Fri, 3 May 2019 22:19:05 +0000 
In-Reply-To: <0e8fa572-e01b-4c42-8544-a8a564256315@www.fastmail.com>
Subject: Re: [PATCH dev-5.0 3/4] mtd: spi-nor: aspeed: use memcpy_fromio() to
 capture the optimization buffer
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Andrew Jeffery" <andrew@aj.id.au>
Date: Fri, 3 May 2019 22:19:06 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <0e8fa572-e01b-4c42-8544-a8a564256315@www.fastmail.com>,
 <20190417133941.22962-4-clg@kaod.org>
 <20190417133941.22962-1-clg@kaod.org>
 <OF33F9274D.5DFDAC84-ON002583E0.00758962-002583E0.0075896A@notes.na.collabserv.com>
 <a8ab1055-64c6-4763-b244-2a17e70a10a1@www.fastmail.com>
 <d3ca43d0-0b47-bcd4-c2ae-d70226b5d12f@kaod.org>
 <090455f7-21dd-4e96-888e-1b23592bdfa3@www.fastmail.com>
 <a914efb5-758f-b586-15f8-460ea6cbb225@kaod.org>
X-Mailer: IBM iNotes ($HaikuForm 1048) | IBM Domino Build
 SCN1812108_20180501T0841_FP38 April 10, 2019 at 11:56
X-LLNOutbound: False
X-Disclaimed: 8247
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19050322-7769-0000-0000-0000069CFB46
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.255067
X-IBM-SpamModules-Versions: BY=3.00011043; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01198164; UDB=6.00628489; IPR=6.00979026; 
 BA=6.00006298; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00026720; XFM=3.00000015;
 UTC=2019-05-03 22:19:09
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-05-03 20:09:11 - 6.00009881
x-cbparentid: 19050322-7770-0000-0000-000030B41DA0
Message-Id: <OF6A772141.C23D5F35-ON002583EF.0079F21E-002583EF.007A9963@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-03_14:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
Cc: openbmc@lists.ozlabs.org,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 05/01/2019 10:53PM in some timezone, Andrew Jeffery <andrew@aj.id.au> wr=
ote:

>On Fri, 19 Apr 2019, at 17:39, C=C3=A9dric Le Goater wrote:>> On 4/19/19 9=
:23 AM, Andrew Jeffery wrote:
>> > Hi C=C3=A9dric
>> >=20
>> > On Fri, 19 Apr 2019, at 15:32, C=C3=A9dric Le Goater wrote:
>> >> On 4/19/19 3:03 AM, Andrew Jeffery wrote:
>> >>>
>> >>>
>> >>> On Fri, 19 Apr 2019, at 06:53, Milton Miller II wrote:
>> >>>> About 04/17/2019 09:20AM in some timezone, C=C3=A9dric Le Goater
>wrote:
>> >>>>
>> >>>>
>> >>>>> aspeed=5Fsmc=5Fread=5Ffrom=5Fahb() only reads the first word which=
 is
>not
>> >>>>> what
>> >>>>> we want. We want to capture a CALIBRATE=5FBUF=5FSIZE size window
>of the
>> >>>>> flash contents to optimize the read.
>> >>>>>
>> >>>>
>> >>>> NACK
>> >>>>
>> >>>> This justifcation is false.  The routine reads the whole
>buffer
>> >>>> because it calls the =5Frep routine and takes the size.
>> >>
>> >> It doesn't AFAICT looking at other drivers and also from my
>test.
>> >>
>> >>>> In addition, the comment just before aspeed=5Fsmc=5Fread=5Ffrom=5Fa=
hb
>> >>>> tells why memcpy=5Ffromio and memcpy=5Ftoio are broken on 32 bit
>> >>
>> >> That might have been the case on Linux 4.7. It doesn't seem to
>be=20
>> >> the case anymore. See below.
>> >>
>> >>>> arm, and this is still the case judging from the recent bug
>> >>>> reportfrom a Nuvaton user [1].
>> >>>>
>> >>>> [1]
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=5Fgithub.com=5Fop=
enb
>mc=5Fopenbmc=5Fissues=5F3521&d=3DDwIFaQ&c=3Djf=5FiaSHvJObTbx-siA1ZOg&r=3Db=
vv7AJEECo
>RKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=3DsK1b4XTLYG8JeD8M-9ido3CQX=5FAOERqbR
>DK4EyTZHWc&s=3DfYtUMc0yvOgIU3iNg2S3anMU3YSmstjFPxQR3JpCtco&e=3D
>> >>>>
>> >>>> Andrew, Please revert this patch.
>> >>
>> >> I don't think you have enough convincing arguments for that.
>> >=20
>> > That may be the case, but having seen the pain of the original
>corruption
>> > problems that drove the ioreadX=5Frep() implementation above,
>Milton's
>> > protest combined with my initial, briefly nagging concern was
>enough for
>> > me to revert. Two things here:
>> >=20
>> > 1. We've run without this patch for quite some time. Despite
>oddities,
>> > the existing implementation has been stable
>> > 2. With patch 4/4, you've resolved the 4B corruption problem.
>This was
>> > the immediate concern, as it was impacting teams developing and
>> > testing OpenBMC master. I appreciate the effort you put into
>hunting
>> > that down, the root cause was certainly not obvious.
>> >=20
>> > From *my* testing we appear to be stable both with and without
>this
>> > change, however my concern is that *my* testing is not complete
>enough
>> > to be confident that we're not going to hit the subtle corruption
>problems
>> > that drove the introduction of the existing code.
>>=20
>> QEMU would have caught this regression if SFDP was modeled. It does
>today
>> if 4B opcodes are forced on the mx25l25635e. Given the time the
>team spent
>> on this, I would say 1 or 2PM overall, QEMU is a good investment.=20
>>                                                   ^
>>                                                   |
>> Managers are you reading this ? ------------------+=20
>>=20
>> > For some additional context, I'm now on leave until the 30th, and
>Joel to
>> > the 29th. These patches have been through a process that has
>proceeded
>> > much more hastily than I would have liked, and that's lead to
>where we
>> > are now.
>> >=20
>> > With that in mind, less change is better, and so I have decided
>to back
>> > this patch out. It's a risk-based decision, not a reflection of
>the effort,
>> > desires or technicalities involved.
>>=20
>> Back to where we were before, it's fine as it works.=20
>>=20
>> The optimize reads are just reading the first 4 bytes :
>>=20
>> [   14.130480] aspeed-smc 1e630000.spi: mx25l25635e (32768 Kbytes)
>> [   14.136664] aspeed-smc 1e630000.spi: write control register:
>00122302
>> [   14.143326] aspeed-smc 1e630000.spi: read control register:
>203c2341
>> [   14.149750] aspeed-smc 1e630000.spi: AHB frequency: 192 MHz
>> [   14.181561] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54
>PARTPARTPARTPART
>> [   14.188894] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54
>PARTPARTPARTPART
>> [   14.196230] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54
>PARTPARTPARTPART
>> [   14.203558] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54
>PARTPARTPARTPART
>> [   14.210751] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54
>PARTPARTPARTPART
>> [   14.218067] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54
>PARTPARTPARTPART
>> [   14.225397] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54
>PARTPARTPARTPART
>> [   14.232722] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54
>PARTPARTPARTPART
>> [   14.239912] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54
>PARTPARTPARTPART
>> [   14.247232] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54
>PARTPARTPARTPART
>>=20
>> with memcpy=5Ffromio :
>>=20
>> [   13.779087] aspeed-smc 1e630000.spi: mx25l25635e (32768 Kbytes)
>> [   13.785255] aspeed-smc 1e630000.spi: write control register:
>00122302
>> [   13.791762] aspeed-smc 1e630000.spi: read control register:
>203c2341
>> [   13.798326] aspeed-smc 1e630000.spi: AHB frequency: 192 MHz
>> [   13.815420] 50 41 52 54 00 00 00 01 00 00 00 01 00 00 00 80
>PART............
>> [   13.822759] 00 00 00 1b 00 00 10 00 00 00 20 00 00 00 00 00
>.......... .....
>> [   13.829946] 00 00 00 00 00 00 00 00 00 00 00 00 50 41 62 cf
>............PAb.
>> [   13.837266] 70 61 72 74 00 00 00 00 00 00 00 00 00 00 00 00
>part............
>> [   13.844597] 00 00 00 00 00 00 00 01 ff ff ff ff 00 00 00 01
>................
>> [   13.851788] 00 00 00 03 00 00 00 01 00 00 10 00 00 00 00 00
>................
>> [   13.859105] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>................
>> [   13.866433] 00 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>.@..............
>> [   13.873759] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>................
>> [   13.880951] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>................
>> [   13.888267] 00 00 00 00 00 00 00 00 00 00 00 00 8f de 9d 89
>................
>> [   13.895591] 48 42 49 00 00 00 00 00 00 00 00 00 00 00 00 00
>HBI.............
>> [   13.902917] 00 00 00 10 00 00 05 a0 ff ff ff ff 00 00 00 02
>................
>>=20
>>=20
>> I should have added these tests in the commit log. Sorry about
>that.
>> We will see later on. There are no hurries for this fix.
>Optimization
>> is still being done.
>
>Milton: Given you NACK'ed the patch I'd appreciate a follow-up in
>light of
>this data.
>


Yes, I should have replied last week.

I accept the difference between the case where it fails and=20
the case where its used is the difference between read mode,=20
where the chip verifies the address of each access, and user=20
mode, where the region is decoded at the block level and the=20
data is routed through a fifo, where extra reads or writes=20
are problematic.

That said, it will work for read, or where the source and=20
destination have the same alignemnt.  The memcpy routine will=20
cause two transactions in the spi controller, but the result=20
will function.  I'm not sure a write would work.

I withdraw my NACK.

milton

