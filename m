Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2183C1537
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 16:32:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLJfF2ztkz3bhZ
	for <lists+openbmc@lfdr.de>; Fri,  9 Jul 2021 00:32:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=csLk6V4r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0823bd291c=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=csLk6V4r; dkim-atps=neutral
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLJdt1vplz2yLy
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jul 2021 00:31:58 +1000 (AEST)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168EIJha003213
 for <openbmc@lists.ozlabs.org>; Thu, 8 Jul 2021 14:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=pps0720;
 bh=VLKAB9crdCHVS0XbVGlxhLYOkt6GqYX2RHWl8XkjlMw=;
 b=csLk6V4rPeM8jwQ4Gn9sOLDg7iJaMza7jqRRDIm6T+w/KnsTwdtY27g3Ok3y1+98PnRP
 6g68EiZnYrraiM5F/d9W9W/g1On9Y5J/8mc94bYSCc9E3QFB2IVNOa7ps/aI+UT1bPBn
 ebIHqfh6Er78yljhTNJpcoQ7EXNBntSgFTs6Wbs5jPCF9wFgP4DBGYFz/59ZbE0FL3oR
 xRAwRGkhA6Mik33g1OBd8wUCoftGjDLN3/UXVsEdP4EsV2pbB4QCAr7onxl9qaIQXWQb
 Qw9lIehdwcZCAB5q0NYlOJZJXZXzZ3yWXejmfW8d75hEeORU9g6OLZw/sSAUwW1lnz/7 Fg== 
Received: from g2t2353.austin.hpe.com (g2t2353.austin.hpe.com [15.233.44.26])
 by mx0b-002e3701.pphosted.com with ESMTP id 39ndpykb69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 08 Jul 2021 14:31:54 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com
 [16.193.72.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2353.austin.hpe.com (Postfix) with ESMTPS id 88FFD84
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jul 2021 14:31:53 +0000 (UTC)
Received: from G4W9335.americas.hpqcorp.net (16.208.33.85) by
 G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Thu, 8 Jul 2021 14:31:53 +0000
Received: from G4W10204.americas.hpqcorp.net (2002:10cf:5210::10cf:5210) by
 G4W9335.americas.hpqcorp.net (2002:10d0:2155::10d0:2155) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Thu, 8 Jul 2021 14:31:46 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (15.241.52.11) by
 G4W10204.americas.hpqcorp.net (16.207.82.16) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.18 via Frontend Transport; Thu, 8 Jul 2021 14:31:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1o4z+HGzWQdvEyIqFm6MOEQa9z2bVIpzpRqdFutSMKXTZMXN3jRWEQVNpD2obhOleCLzsPFPZ1ECTNn9ES2b2/wiGKGq61GLGFjcJwnv77SHEtMIIzlG5PT1YpFou0ViWLch5FryU13yAehClgovxGTRu9hTpaHXak6MXHctzOPwoebphAsd8o5NGX3dkWrwcbYIPje8j+/Qz5zg+DxXoAf7CfdF48t04kHrXcIIDhl0nNXaL2fHRs8RHVsAPrw/svBm0zTIED4ND3CI8dn6xccGDfLTGaIXAR68bjX/F9eeAUTbfqqJcftklmRjORWMspWyeIWWW3ucyv8DcpV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLKAB9crdCHVS0XbVGlxhLYOkt6GqYX2RHWl8XkjlMw=;
 b=I3QMPvjABsyh2D0AifI/0t5hwFLLove/1KWPMJRjZvXZXNYck8blx2Olr3Ri4lYv2xnSk3yDNolJr5i9TG1KqaAbX5KKqI+L/VE4HSbpV2BB9CDGSPjxL2w0rUoiTFU3OocCJveQA3v5RWkUC9xzaODOHmEGMPK+/ZyPqe0AOTXgy3QO2JzgaIm1O2vYynC59XdATu0gffUyBKR49SXScXwDvdHWxtKUFFvi1t41mmY+0goLCj2/aAQDTVa0a50CrTlupu9+qcuJj6s7Jcp2Tp9YcN5jOOBka2w0SKK9iiyc7jjNiUCulWhwoWx3rjzUfjLbOsN+1IA3iFV+jfLhPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760b::12) by DF4PR8401MB0635.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7608::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Thu, 8 Jul
 2021 14:31:44 +0000
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::157:d9fc:2a87:4617]) by DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::157:d9fc:2a87:4617%3]) with mapi id 15.20.4287.034; Thu, 8 Jul 2021
 14:31:44 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Using smbios-mdr:  expected file format
Thread-Topic: Using smbios-mdr:  expected file format
Thread-Index: Add0BakIgUuHikZ9S+SAUphx3wy9JA==
Date: Thu, 8 Jul 2021 14:31:44 +0000
Message-ID: <DF4PR8401MB063422AB09B179DBD08A32F48F199@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=hpe.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e21d331-451c-4d50-b5b5-08d9421d1c70
x-ms-traffictypediagnostic: DF4PR8401MB0635:
x-microsoft-antispam-prvs: <DF4PR8401MB063586C67267E053F48ABFEF8F199@DF4PR8401MB0635.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LccPtSiK9coLbyFawC2dF1y3oWQvGxMtimgb4Vd0bpeypaf9AGK5gEDKrf+XVqdPUvYlFk25J/R23skiha/GV6XxXjdcu2on6K5ixPVyBaN1akgR5JY0WWjhNIsiai8EfVbeDQ8hrDenGzXE7aiSEC0dECGT/DT9CHFj/y83G/Qekg72ScKWgnWDS0i6EeNsSwlVKTOapK37fp13+zg2ZZNswn0yEM325ZeYg9E1FoiI8+OIgc6wfjmD0erx7WyVGC/KrZfvOd32geZ6shH/zevIToNobVozkki/JCvgtiQaneQmR3l5879im7siIgIk23E7xsaP6trFJxxDiXl9r//kNCKo4wAK6zqmDynjDPGkmLBtYrPSbpNT00b3WbAtm3ZehEH2bjKTF8uLXYn8sNET41WcHaTGjwWa9p8Mz/b+nMhaEy2GCiDMvyWTpxwn3G5hDhm+xs9R7Dp9yGTrpU4XCxY4omq8jH5C+3wvk2a1NgCvdO3KPyo+ApHQXLGegKkdBENMliPEyyWrkT6LNGsiuldA8P+iEpCeC4OlLap/IkAD3DwBzuMb2f6gV1lwoR8osS93NPf3Iudjgqja0fYC6QGuvHDvYCSbDQUNE40FJ5ZU/ZOIvX6oM1ykdZzZrjV4hBNE3pAZaXDJC9dHEA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(376002)(136003)(396003)(9686003)(55016002)(33656002)(4744005)(38100700002)(316002)(478600001)(71200400001)(6916009)(52536014)(66446008)(186003)(6506007)(66556008)(76116006)(66476007)(66946007)(64756008)(7696005)(26005)(122000001)(5660300002)(83380400001)(86362001)(2906002)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kMbeDxhjscfVvQOHyVKaq9Fjr0RxkrRfpl1Ek5pG3Y9eZyu36lQ37c0JhhjJ?=
 =?us-ascii?Q?1uPPkMJqH2jYKRHTvrzvtPfgjO9LHhN0J04+vEaMTapOo5ibCP3SUoxxSyce?=
 =?us-ascii?Q?Z1RPyxHj3gXtfaB2mD4SQ9iBEFlr7HiDROuEewLbNkfWHLDHYrFzlG8DNccc?=
 =?us-ascii?Q?nGKsyQfysT75WS6z4s1e62bgA3gwlIwcWdEeXFo71Lb+CVEEz4rppoCsy5Kx?=
 =?us-ascii?Q?DfvLq4aJ7OHGUxtfEQ1pe1S1GjjC8SmND2850daRh2V8UPCIxVpOWRQOt1iH?=
 =?us-ascii?Q?tM/Smr8yS7Ie+AvLZ2FDi+ZyZklJ4hmiNLaiL70qkT16PmWumApJqJkcdjx/?=
 =?us-ascii?Q?xxR0uRK/GImu7Gw2eCE95pq2TpsjSwj29asOkfeGyI/BFL3KjVsS3xZhCJe5?=
 =?us-ascii?Q?i58vE0qSXBDF4hqru4DV85og/tPcSfr+USUpDRIyuXIruRvR2xOeAImiEN/7?=
 =?us-ascii?Q?IzWz4H11vBZxJnT1xPJPrg0G2qGKXUXgQYVOxrCUN5iUgX+A80GiX47IL1Am?=
 =?us-ascii?Q?mpE5x4qFxZGeqMDrq9fpUhHIqeN6cJRv7XyHk4VnLAJewwbe3yIZ9EKVG2rj?=
 =?us-ascii?Q?bMHcsSmCJllX2f7tJ9EvZbhcONDDm5WZcZTgCRsJNpb2xqyO5Pb6Brr2ni3w?=
 =?us-ascii?Q?uUDZCnWe6cFa67NhChTF8jI7I74juT0c5R1rz6eQWvKedUebIiNqeBUzC1AQ?=
 =?us-ascii?Q?DfmOOpNf+509zgWJC6JixsuXrn/lHCgzjrHTnAVR1GBHTVpNHMTkSwpCmZOx?=
 =?us-ascii?Q?gWx831EvEJBc+vAzgxkNdrhj/3PfLTbbXGjQAyu3hO5A289UFTTfm8T4Zzcn?=
 =?us-ascii?Q?Ad3moR1cu2hgPGT0OH0oN0Z7ccj2zdYN+6EpWTlp4M7wMt7uNYoedMHjHUvZ?=
 =?us-ascii?Q?RJM59N46frLELL8moZtLAs5mWLF4qmabkmZpt+s8P5KHV2cd5Ay20ewoMfo8?=
 =?us-ascii?Q?pOBpxWX6/gLUvwted3CUa3SQnqPSIbhVE28Xy49jKMWX22oREz7neHe6uylj?=
 =?us-ascii?Q?hizAysIDy6Qz4U0P0pkpCYiG58K0TzLfJ6K7qoW+3qFB1tXVp1cnBVALRu/e?=
 =?us-ascii?Q?cETaKIdjp6eaNPrae8D9OvIIqOGcEG7EpngW/WQk5AaX5MWUz/oNzZDyM4O1?=
 =?us-ascii?Q?wdievn0alP+y2hYLmWlsAHn3mP0Dpv9Wu9b4tW3q7x6UlII4dAmH7mWxm6Ol?=
 =?us-ascii?Q?nT9AzEaGukm7u5I2sSVDaPtPsrdgARSUEBuRi/bAePqGGttH74CByIwtW9ef?=
 =?us-ascii?Q?zIHFppOk2t3VAyKIrty3t3tywIs5gPmoxf/sWe83gBDI4hHo1o7Zv65jcgGe?=
 =?us-ascii?Q?sqiGtUVrL8OpTLGBbvse3dUm?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DF4PR8401MB063422AB09B179DBD08A32F48F199DF4PR8401MB0634_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e21d331-451c-4d50-b5b5-08d9421d1c70
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2021 14:31:44.7159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KoNEGjIseODfgfoynFkTB2H9hpj/NGNt27jtUuw5wah4YBVo2HQffnO9X7fBVQBd3ryBnwTG01tiOYwlSuQyYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0635
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: ba3Pvbnd1dxTIHvG-LhzbnumfD-WdlIL
X-Proofpoint-ORIG-GUID: ba3Pvbnd1dxTIHvG-LhzbnumfD-WdlIL
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_06:2021-07-08,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080078
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DF4PR8401MB063422AB09B179DBD08A32F48F199DF4PR8401MB0634_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We have a method to transfer SMBIOS tables to the BMC (a legacy HPE-specifi=
c method implemented in our UEFI firmware), and on the BMC side, we can cre=
ate a file at /var/lib/smbios/smbios2.  We have also integrated smbios-mdr =
into the build.  I'd like to match up our file format with what is expected=
 by the smbios-mdr code to unlock all the goodness onto dbus.

Is there any documentation on the expected format of the file?  I gather th=
ere's a header (struct MDRSMBIOSHeader) But what structure is imposed over =
the rest of the data.  I'm hoping its something as simple as a concatenated=
 set of SMBIOS records as defined in the spec (header(type, length, handle)=
, type-specific-data, double-nulls).

Thanks,

Mike

--_000_DF4PR8401MB063422AB09B179DBD08A32F48F199DF4PR8401MB0634_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">We have a method to transfer SMBIOS tables to the BM=
C (a legacy HPE-specific method implemented in our UEFI firmware), and on t=
he BMC side, we can create a file at /var/lib/smbios/smbios2.&nbsp; We have=
 also integrated smbios-mdr into the build.&nbsp;
 I&#8217;d like to match up our file format with what is expected by the sm=
bios-mdr code to unlock all the goodness onto dbus.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there any documentation on the expected format of=
 the file?&nbsp; I gather there&#8217;s a header (struct MDRSMBIOSHeader) B=
ut what structure is imposed over the rest of the data.&nbsp; I&#8217;m hop=
ing its something as simple as a concatenated set of SMBIOS
 records as defined in the spec (header(type, length, handle), type-specifi=
c-data, double-nulls).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Mike<o:p></o:p></p>
</div>
</body>
</html>

--_000_DF4PR8401MB063422AB09B179DBD08A32F48F199DF4PR8401MB0634_--
