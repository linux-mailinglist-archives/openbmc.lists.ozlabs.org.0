Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A5DBD578
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 01:26:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dHPm1tzyzDqfq
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 09:26:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dHNk1dGmzDqQ5
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 09:25:25 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8ONM7aV037737
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 19:25:21 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v7rq90k37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 19:25:21 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 24 Sep 2019 23:25:20 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 24 Sep 2019 23:25:16 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2019092423251565-1110667 ;
 Tue, 24 Sep 2019 23:25:15 +0000 
In-Reply-To: <20190924194759.26854-2-bradleyb@fuzziesquirrel.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Date: Tue, 24 Sep 2019 23:25:15 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20190924194759.26854-2-bradleyb@fuzziesquirrel.com>,
 <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
X-Mailer: IBM iNotes ($HaikuForm 1054) | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-LLNOutbound: False
X-Disclaimed: 34567
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19092423-1335-0000-0000-00000187652A
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.425523; ST=0; TS=0; UL=0; ISC=; MB=0.000258
X-IBM-SpamModules-Versions: BY=3.00011835; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01266102; UDB=6.00669818; IPR=6.01048055; 
 MB=3.00028793; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-24 23:25:19
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-24 18:18:29 - 6.00010446
x-cbparentid: 19092423-1336-0000-0000-00000456A9AD
Message-Id: <OF8E85BC76.E8ACCE72-ON0025847F.0080A7C2-0025847F.0080A7CA@notes.na.collabserv.com>
Subject: Re:  [PATCH v3 linux dev-5.3 01/10] dt-bindings: aspeed-lpc: Add G6
 compatible strings
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-24_11:, , signatures=0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 09/24/2019 at 02:48PM in some timezone,  Brad Bishop wrote:
>Assume everyhing is the same as the AST2500 since the AST2600
>datasheet
>indicates the same register set behind the LPC controller address
>space.

Can we drop everything upto and including since?

>
>Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>---
>  v2: new for v2
>  v3: move ipmi binding updates to a separate patch
>---
> Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>
>diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
>b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
>index 86446074e206..e1197bab57bb 100644
>--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
>+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
>@@ -46,6 +46,7 @@ Required properties
> - compatible:	One of:
> 		"aspeed,ast2400-lpc", "simple-mfd"
> 		"aspeed,ast2500-lpc", "simple-mfd"
>+		"aspeed,ast2600-lpc", "simple-mfd"
>=20
> - reg:		contains the physical address and length values of the
>Aspeed
>                 LPC memory region.
>@@ -64,6 +65,7 @@ BMC Node
> - compatible:	One of:
> 		"aspeed,ast2400-lpc-bmc"
> 		"aspeed,ast2500-lpc-bmc"
>+		"aspeed,ast2600-lpc-bmc"
>=20
> - reg:		contains the physical address and length values of the
>                 H8S/2168-compatible LPC controller memory region
>@@ -74,6 +76,7 @@ Host Node
> - compatible:   One of:
> 		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
> 		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
>+		"aspeed,ast2600-lpc-host", "simple-mfd", "syscon"
>=20
> - reg:		contains the address and length values of the host-related
>                 register space for the Aspeed LPC controller
>@@ -128,6 +131,7 @@ Required properties:
> - compatible:	One of:
> 		"aspeed,ast2400-lpc-ctrl";
> 		"aspeed,ast2500-lpc-ctrl";
>+		"aspeed,ast2600-lpc-ctrl";
>=20
> - reg:		contains offset/length values of the host interface
>controller
> 		memory regions
>@@ -168,6 +172,7 @@ Required properties:
> - compatible:	One of:
> 		"aspeed,ast2400-lhc";
> 		"aspeed,ast2500-lhc";
>+		"aspeed,ast2600-lhc";
>=20
> - reg:		contains offset/length values of the LHC memory regions. In
>the
> 		AST2400 and AST2500 there are two regions.
>@@ -187,7 +192,8 @@ state of the LPC bus. Some systems may chose to
>modify this configuration.
>=20
> Required properties:
>=20
>- - compatible:		"aspeed,ast2500-lpc-reset" or
>+ - compatible:		"aspeed,ast2600-lpc-reset" or
>+			"aspeed,ast2500-lpc-reset"
> 			"aspeed,ast2400-lpc-reset"

Minor nit:  This one disn't use the phrase "One of" and needs either anothe=
r=20
instance of "or", or it needs to adopt the "One of" like the other bindings=
.=20

>  - reg:			offset and length of the IP in the LHC memory region
>  - #reset-controller	indicates the number of reset cells expected
>--=20
>2.21.0
>
>

Thanks,
miilton

