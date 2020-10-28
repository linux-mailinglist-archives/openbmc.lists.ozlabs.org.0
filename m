Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0629D162
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 18:58:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLxBJ2060zDqVP
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 04:58:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ShtIw+6r; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLx9Y1vTRzDqTF
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 04:57:18 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SHXfi7072966
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 13:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=JQhR/Nv/vvo7hFSYpxiUK5GNmrauSPAiJfWGG4Qmosw=;
 b=ShtIw+6r7+wL1f27m979eny8a80rc5sIAjo1AamrF06T5vdq6Qa/Q5MWyOd1113x/dhv
 Q2a0wHqAsGiwSyjUu3Waj+wgpnTd3Qz7X5XbCjGkSGTLiaNMZSYK87hpBBKARpEWrdHr
 80W978i2CYxDg3TD3otkzFU7Su0Dnq9BpYsp3zU4VGsx731VFwa0xOvpmxC3v1Cy66Nk
 +TpAT4sstHa4rPrkLM5HYhy8IYfTCC1s1eiI68NxZ3h4YSx9QkdtUNOXzxBSJlC5qw5F
 qLoPl+PHSoWfq4Z9mzTXd8ru6PU6tXO62Q552/nfcumAOTinZcA959wnxoZH8wHOz45Q jA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34dcqfs4ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 13:57:15 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 28 Oct 2020 17:57:15 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 28 Oct 2020 17:57:12 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2020102817571178-641543 ;
 Wed, 28 Oct 2020 17:57:11 +0000 
In-Reply-To: <2332af3cb404478cbd7bc0902167c7ea@SCL-EXCHMB-13.phoenix.com>
Subject: Re: With webui-vue Firmware version on Overview vs Hardware status BMC
 manager not always matching.
From: "Derick Montague" <Derick.Montague@ibm.com>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
Date: Wed, 28 Oct 2020 17:57:11 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <2332af3cb404478cbd7bc0902167c7ea@SCL-EXCHMB-13.phoenix.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 64443
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20102817-2475-0000-0000-000004678CBE
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.102035
X-IBM-SpamModules-Versions: BY=3.00014094; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01455786; UDB=6.00783112; IPR=6.01238469; 
 MB=3.00034743; MTD=3.00000008; XFM=3.00000015; UTC=2020-10-28 17:57:13
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-10-28 15:54:03 - 6.00012008
x-cbparentid: 20102817-2476-0000-0000-0000DAD69245
Message-Id: <OF96903A57.FBB55CE2-ON0025860F.0060C60B-0025860F.00629E7F@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 4 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_08:2020-10-28,
 2020-10-28 signatures=0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> With webui-vue Firmware version on Overview vs Hardware status BMC manage=
r not always matching.
>=20
> These are screen shots.
>=20
> I find Romulus is not having this issue:
> 	Overview - https://bmc-bruce.github.io/Romulus_Overview_Firmware-version=
.png=20
> 	Hardware status - https://bmc-bruce.github.io/Romulus_Hardware-status_Fi=
rmware-version.png=20
>=20
> Where our build does show this issue:
> 	Overview - https://bmc-bruce.github.io/Phoenix_Overview_Firmware-version=
.png=20
> 	Hardware status - https://bmc-bruce.github.io/Phoenix_Hardware-status_Fi=
rmware-version.png=20

> I am curious as to how Hardware status gets the (BMC) Firmware version as=
 compared to how Overview gets the (BMC) Firmware version.

They are looking in different properties. I am not 100% sure why and it mig=
ht
be able to be simplified. However, given the information, I would expect th=
at=20
you are also missing the FW versions on the FW update page also.

It looks like the Overview page uses the Firmware store that calls=20
/redfish/v1/Managers/bmc and gets the value from the Links.ActiveSoftware i=
mage.


On the Hardware page uses the BMC store that also uses redfish/v1/Managers/=
bmc
and it gets the version from the FirmwareVersion property returned.

I would expect you to also be missing the FW versions on the FW page also.

https://imgur.com/a/TojENYX

Is that true?



