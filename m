Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA923A352A
	for <lists+openbmc@lfdr.de>; Thu, 10 Jun 2021 22:54:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1GRX6j7dz3bsP
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 06:54:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=C75Njr7S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=079597c775=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=C75Njr7S; dkim-atps=neutral
X-Greylist: delayed 1614 seconds by postgrey-1.36 at boromir;
 Fri, 11 Jun 2021 06:53:42 AEST
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1GRB2vT1z306P
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 06:53:38 +1000 (AEST)
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15AKDq4P014404; Thu, 10 Jun 2021 20:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps0720; bh=prFhvC27uZjcRtGDvi5T5v1VcmGdGSA6/xKCttyp8uw=;
 b=C75Njr7S48k2FL2fvMtVFQGgT5ysMhW2lRzrPMaOsr/HNzviS2WxW6iNV9TGRRwsAD8S
 wBZMIHxpEILkJCInThzbZ1yfJ6a4Mr4h7ipFnTKC0+meAYsz9MTReOHLFrHR3sukXXls
 IBKUlHk64sSpU4lltiaP8CxgAPYiA7V6aBh6CF4lnPwBqs1wmz9GoPbUwlO5bV2RsJ9q
 xOObURwqmms06GifRZvJWcZafXNRaRuTRfU7Hw/l1P5AFu9C0ItkvJ5nnniCbtNickSj
 YJ0u5qz1TtyrrLViy34yFYuJYNZaD0ft23Cu7aHf0XVIHUrLS75bHhdJHnYJx9WtR043 VA== 
Received: from g4t3426.houston.hpe.com (g4t3426.houston.hpe.com
 [15.241.140.75])
 by mx0b-002e3701.pphosted.com with ESMTP id 393h9sw23r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 20:26:38 +0000
Received: from G4W9120.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net
 [16.210.21.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3426.houston.hpe.com (Postfix) with ESMTPS id 8F3275A;
 Thu, 10 Jun 2021 20:26:37 +0000 (UTC)
Received: from G1W8107.americas.hpqcorp.net (2002:10c1:483b::10c1:483b) by
 G4W9120.americas.hpqcorp.net (2002:10d2:150f::10d2:150f) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 20:26:22 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (15.241.52.13) by
 G1W8107.americas.hpqcorp.net (16.193.72.59) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.18 via Frontend Transport; Thu, 10 Jun 2021 20:26:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huVtvL318SI1ttCadWAqZV6vYD1WNnKIYgfB/WPteDMfQtownTC29QumCru8G79lxmhloWBj2GbVsUBifI/coAHb7nYmKcV3yaBk5SJCgoNDGhI5LM5+ucYcQLk5jG5A96fia9/1K5vRbUJXclC5fv7e0tE8FWU+BsT/7Wt+vVBg9w9OXF4qUvLnp0Oi/XmlDcjqFEnNZiigxVQR5F3N2ECfatduGAqcip4aI0QT+iLk2J89JMbJkds5hOXDfwUJdDrGdjcPdL3V3ZmtjCrajwBZ4ui6qCfI5ELKY2h9iW3yRttjUHcmQwiExnG0AFR5d4C7kem/haN215hJM5DLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prFhvC27uZjcRtGDvi5T5v1VcmGdGSA6/xKCttyp8uw=;
 b=gxO2qAJA++IOoB/sKmVyhyz7c6iqhhZCDtbSED0Ss3fR/jJKd3/Yjqm302Adabj8mIYqpysM+CopDohJFPUEKQrOknhb6W3LefxrOkvJZkcPP17Ph7La8wwRCBS/sl111JnYRbVgQYDmult+V4cimc/rGgYyRIJlROlEJP2o4B2i6+HxjfE05pUg0tr+oqlUnkgNsxMcN/++uaE6HppDiTX1tPDrseOxlnJabifPV3pjziIDp23sq2luDaSt8gJ7Z4v9hsldsg9mIVFLGzLqs5LimAFYX1IQjEsUqz3v3ZJP6iIRcQbwkfghGTNpO8a/UhtxtME2IoS4AgTsiphGJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760b::12) by DF4PR8401MB0729.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7605::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 20:26:21 +0000
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::18fb:6a9b:390e:1488]) by DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::18fb:6a9b:390e:1488%11]) with mapi id 15.20.4195.030; Thu, 10 Jun
 2021 20:26:21 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RDE Enablement
Thread-Topic: RDE Enablement
Thread-Index: AddeNQks2n5bD9svT5WNVI3gUyZzFA==
Date: Thu, 10 Jun 2021 20:26:21 +0000
Message-ID: <DF4PR8401MB0634B89E3FF275E28FB590CC8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [165.225.217.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2c67393-d33d-4be6-2af6-08d92c4e02b9
x-ms-traffictypediagnostic: DF4PR8401MB0729:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DF4PR8401MB0729287A7FD7D2477CC94ADB8F359@DF4PR8401MB0729.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DAWw2h2iR9sKRTpo24t46X29uBLk+pk6MzODExt5TjkGwSWHqVYUgThsIL3FyJLv2x798TnZ/BqbZKFaY5xzSH90dS5ZaJxxcJH1VUlxnQenN+GPeSmlwVKwH68+JzRj7RTO8AJwWhXivG4kA8gMI35BvmFeQnJQ1XxjQvPq+tOXHhdQc+YemOPacUNFnZAKNJqKCZ4UKdXOuLe0YYyBqsj0wXEIQ15RCnl6srqdcplm/t9df+oE7rIX9sy2SyNCK14orTB4maUkW3xeojYWpEu3pDT8ZoWoUJYrhxhbk07c1xcWyEX1VOoTzemIUbIxI8rOiOdjSg4eF2dNF0LI6AXh313hj6SNmik5fhNHwNELmNuBBGyN9tEHP+ldvehzAmHig0w5JoRQ1V5eTOzitSJE8ggTQ+SaRasOXkImPZn0DprkDZOTAGAt+OBjCWZ+fbRnxR3BXxTEZ4+WCXJXGDAwGnqNLtpebiX6FUQFfkK39qyDUrQiv2dEn42q3cM7dk7Q4FvX/6IGfcTjveDlUBeL0lT2eN/UWIRgOIFcpWBILTJp9IOOaqNd2D8jr0nIYH1cKFfxh6DzEtExTOc9DuxPnlcwvRSL9q16Bb5S3c0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(39860400002)(376002)(55236004)(26005)(86362001)(55016002)(8936002)(6506007)(5660300002)(64756008)(6916009)(38100700002)(7116003)(66446008)(52536014)(3480700007)(478600001)(9686003)(66476007)(4326008)(186003)(76116006)(54906003)(4744005)(33656002)(71200400001)(122000001)(66946007)(316002)(7696005)(8676002)(66556008)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Vxu0Eusexxoawmc80LKm6pp4ywGSuQIe0ki/ryvprkfZeRFAd34kwzVUGbpo?=
 =?us-ascii?Q?RlfYy59oY1nL+3u0yNaqtNpAS8FpUI3qpgiXnSbdAjwkJbWpsjyeeD+RRT4R?=
 =?us-ascii?Q?uP2kobAgSwSnyF2ZKYabYk+xY2jpmVRgmSszV9ruXSPPzLllN2ELLIGvgTsh?=
 =?us-ascii?Q?tBgE1HyYc9Mt/JlHRTEe3olUUtsOWkpfC5YTavWfchf0aLBcStMVR0Qm1Tnt?=
 =?us-ascii?Q?o7038soBQvndWHLLKsDiIgiD6XG/Z/z0noYUGk51GpRZnCDEgBcCsssAW4Jf?=
 =?us-ascii?Q?OMF1NQO1IFLnH7/3jrgiy2BcF9OSgTj7G25827YQtwLaZvXOqRCQIMfWtyUn?=
 =?us-ascii?Q?H4LwMCac47ps3LYrDTiYCwursRueaeVnU7UVN1JnYMpxxKdOBwdSrmewUJ9a?=
 =?us-ascii?Q?Xp4iKY77knhllVBe+7hV3b6m+RS+aET48KXnDIAgRXoFgVJwtK/88IRDnBlZ?=
 =?us-ascii?Q?QDAPN81wUT5S5ZNbvrjZ3eJpRnYU/zt7FRBDibf+LtqBZ6y2PoThQvd/6jBa?=
 =?us-ascii?Q?ZfDSC4ilsOgNDGKCXF47cdnHFRrTooTyVFC5mRrC7QIc886wuO55AK3wSaJo?=
 =?us-ascii?Q?3QVwVFieTFd94jWYXaGJLTUhTCgW1jpjJsJmOPNxSL1QOU9JwQXgdDchgi4B?=
 =?us-ascii?Q?WH6pQN7JQGEbDbME1NlcEUBnp7K6WiFWyZ3qqB/7t1i/lkZNXcmoawE1lkGn?=
 =?us-ascii?Q?FjjSRZNgUYiVncGVlE5M3M9CVSzCV3hJWpHkJDi/sI7Z3X+hFxjIXVm03zJ9?=
 =?us-ascii?Q?ZAE61Vwc8op8+Qhe3r15kdGDVkXf8erpeXegkdL2GeLtt4vIDBofe54OBmmK?=
 =?us-ascii?Q?N4/ff2wVdUcnDfi/KEE8sTJWYi9ddIq4t5onexrNlAYUX+1jULbRX5OjNZla?=
 =?us-ascii?Q?vSmSg6T4dHrRkbjEoGPcE5snA5sJa9Wti3aHOfh2SxRRfTQTYMshU1eaz8ti?=
 =?us-ascii?Q?AS/fX+G3SQzmKqfaFBYgDsgRG1kG/ThlIT8jwbh+A47gQzNce12PnDE34oZT?=
 =?us-ascii?Q?waqVl4iNzqfO8p4Pl73iJlJF9XAq1Y8OMeWaPAiJuyd4iC/E6nPgiojpCBgt?=
 =?us-ascii?Q?NN6/jrbg0W3dNcsqe8vfyFp6jAEKv4Obd0xHhAZH4AgW+F8n445B1f0xFI86?=
 =?us-ascii?Q?x5Jctpb/dCesjZu8xhwz3HzMnfMx0VY2OOGpYm6teZvxU2D7tdaD3PaQhCTF?=
 =?us-ascii?Q?WfedNGaDlKOeR0N92vw7WacYwAiQjP1Qw9pX5urq41l+AZtyOL+w9ozqx3ly?=
 =?us-ascii?Q?Zlo8csHhqaBaomwDpcS21QAWZbv7LAXD1z8pmWMJB0v3uUsBYFAB+o2HNCZN?=
 =?us-ascii?Q?kJjGZmy2HPGuZqwRFPB7RSGg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c67393-d33d-4be6-2af6-08d92c4e02b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 20:26:21.2777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8if2oEAYAZ/cOLxg/TNYd0lpfB3SletnjrX51UJeuzdU6e+P7tKa+87ovPCLgLapBzEok2LEgs+2j8zHDo32TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0729
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: HMBS1rTCGsZi5RI32bfI8tMInhF1_Rpd
X-Proofpoint-GUID: HMBS1rTCGsZi5RI32bfI8tMInhF1_Rpd
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_13:2021-06-10,
 2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1011
 spamscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100130
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
Cc: Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Greetings,

I'm am interested to know if there has been any organized discussion or dev=
elopment on Redfish Device Enablement (RDE - DMTF DSP0218) for moving encod=
ed Redfish data across PLDM/MCTP interfaces.  We are interested in promotin=
g this standard and are willing to lead a reference implementation for Open=
BMC if there is not yet something in progress.  If there is something in pr=
ogress, can you point me at the work because I would love to see it.

What is the normal sequence for proposing, debating and finalizing major ne=
w features?  Would I submit something in Gerrit for review (e.g. a markdown=
 file for the docs/designs repo?)   We could probably get something started=
 fairly soon.

Thanks.

Mike
