Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 146AD3D7AB6
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 18:14:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZ21D6kNyz3bW9
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 02:14:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=kT3mFFvV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0842f1fb7d=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=kT3mFFvV; dkim-atps=neutral
X-Greylist: delayed 1614 seconds by postgrey-1.36 at boromir;
 Wed, 28 Jul 2021 02:14:08 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZ20w31sFz2yN6
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jul 2021 02:14:06 +1000 (AEST)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16RFhZEL009724; Tue, 27 Jul 2021 15:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pps0720; bh=U8ereYQcV3n5pA/IHUEHJjq4uFZ2cNuuLXOb+uvpRHs=;
 b=kT3mFFvVwNnCS7DkV4YWXvqoAmLT4tJ+2rhxXuCUWpWuHVf/OpstH2XtPl6q2PHyia2g
 YBwJBpL7wFnMRQnOOkSdSs+egf5mlYMXJk7VWx8zENL2vI4+B3CZQiHmD+LytkPNKIOL
 r4SHQtQTenLIYTumUT8NSgxLbDksF1vR0KRQT4ywLj3c236hO0DgaKnt31CEfVTlD/t4
 1ABOoiXh/wwpA0eZTPf8iwnz4Mb448i/dLzy0lrLbGjC6/ALD+qvjUzAMnlM9q75JkLm
 87zIWLjYTfNsz1umbRqQ87z0Sd7RfIW6yvxnJ9DFr2hgroAFFgzJEW1YE0l00CyI9uuO uw== 
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com
 [15.241.140.73])
 by mx0a-002e3701.pphosted.com with ESMTP id 3a236g0fj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 15:47:06 +0000
Received: from G9W8455.americas.hpqcorp.net (g9w8455.houston.hp.com
 [16.216.161.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3427.houston.hpe.com (Postfix) with ESMTPS id 01F545C;
 Tue, 27 Jul 2021 15:47:05 +0000 (UTC)
Received: from G4W9120.americas.hpqcorp.net (2002:10d2:150f::10d2:150f) by
 G9W8455.americas.hpqcorp.net (2002:10d8:a15e::10d8:a15e) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Tue, 27 Jul 2021 15:47:05 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (15.241.52.11) by
 G4W9120.americas.hpqcorp.net (16.210.21.15) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.18 via Frontend Transport; Tue, 27 Jul 2021 15:47:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTsKHjeMiCrmyeykXgyZ1e1pjk34PzYhIjsAJ5350WvUPCLCTjCgLUz3j+wmi+/inaoWIRcYikUuumADuG4/nbOM9URcMaBpGM9nd/tGQkt3Ozhzfo9zXlEIfn7gIAgN5hhvDa4Qm4ejz1n77rNExVdzHbOISFUY4KN3YTwynTrJz9/lqQ/ZvEBc+T4dZfKKmmTFdWIpXJeQ41JyEBrrM0CXO4FTcSlnvikCN8OKRWQtzlvvEnRVqOplbblRrhvmhvpY2nKdzMZoYB4G+utZ6j7RdOWF6HTZ6vucmU6stvHTAkwPiX6DsTsxDP+4DcHA/RTQrw/KKueufrlxtkkMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8ereYQcV3n5pA/IHUEHJjq4uFZ2cNuuLXOb+uvpRHs=;
 b=JcI58u99lFtBE9k29MVcSRfPjEPlRgPrSTTr8dsiaapf3xd+Gyvdub0TWMIlv8sWyAfFAl5jGvybB1TuzRqqplr++ftC7NvlF0TrUV+brbOpEKI2Qxf5jNOtctwGEkob5pxEeHKzQDhl88wP2uh+uB8YEcA3cWS7rHOrjUdE2a+8dLlV6IXN1jdx2CL7eGjN3f4dqfpA71oIUhjGJuYN0JrQugrSJl6iEuNmNg9SYOhZMOSA7iDsUgQTLoWrw7W6sRu0LZPCB92X17IL22Wu4q2e0kTShjpVZatOZPtCBeJ6uYYZMllZMQDkA4Ez70QsDsD5vV6se1JeQuoS7hG09w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760b::12) by DF4PR8401MB1308.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7612::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 15:47:04 +0000
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::157:d9fc:2a87:4617]) by DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::157:d9fc:2a87:4617%3]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 15:47:04 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: Artem Senichev <artemsen@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Leveraging and extending smbios-mdr
Thread-Topic: Leveraging and extending smbios-mdr
Thread-Index: AdeC/WhwjpQBMCPLTtGJQffALNU7dw==
Date: Tue, 27 Jul 2021 15:47:04 +0000
Message-ID: <DF4PR8401MB0634147E668CC84648DC883A8FE99@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=hpe.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e5144a6-035c-49ea-5b08-08d95115c84d
x-ms-traffictypediagnostic: DF4PR8401MB1308:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DF4PR8401MB13087E2D19F9613564A697088FE99@DF4PR8401MB1308.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sDpJHTbOGpembzF4V6baZo4OOyzZoGlrBVyzROhtTz4RdFuuKai73g54w5m/d5lrvEIbq6w2/hcCMoYOgwaSvPlhMx2QYWxQDNPTUIbtqHDps+kr3VD6a1TaQu2kHeoyIkLniCrusjiaCN3EAvzkho7vwer127lptEErZZbmOU/79kBpRRBktHXqUEqT5kZdB8gvQlDsJy2FO7huMDif7w2PVOVAEfSS153FJY2AainwfT8/UteNcEavrIvTAwFv3OV+3WKKiUvHMrtIWPv3aiopQc8seTL4VP3yYdA7X+6w+P1mcdsTrtT5DhhiUg0Vdv8v6iEhei0ssWQ86+bnIutRpOp4vP3C2u82jLyrJxLB0P0Pu+e8whujXf1co8GAJPtbHkCEZjzwHbLWL3O2spQ/M3rkF019LCw3m1X6lqvd9ZX0NEZWLMxYiJVF4r42YTGttgfyJhSjALhcaUcWBueQS9W0mgRwaocky7QLU2+H6gk0DK+YMBpn+YJs06k1BXJNPg7eSgoq6JzE6dx9Y1Avpm/UJ1Xz5iQKTC3doyrYzS+P1dVxCqhL9tulo/b7W/lEI+SIuW5mpRZPaab2HEeJ3+uCI81SNj+PHGYYFrlQXOkGjAvLcorv/kbvmuARUWJCVEewwZv7yrJ1auH0JnIbwt4QR6xDmH8q5JADqV4AwoZqz6BswnXA+FUypdrKr7CGvHM/5KoytRYqPmpd9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(86362001)(26005)(8676002)(4744005)(71200400001)(66446008)(66476007)(66946007)(5660300002)(52536014)(110136005)(7696005)(55236004)(6506007)(55016002)(9686003)(4326008)(66556008)(83380400001)(64756008)(122000001)(508600001)(316002)(33656002)(76116006)(8936002)(2906002)(186003)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N3Jh7jqYxaF5Zo0n0a0MrwCTdKH1iq+/g7W+XQ7HxW7BrYIuQdXiOlx3VE0v?=
 =?us-ascii?Q?xxNLo40b/x8I+1Rd3tOY+B3C0T0K9l2h9mqOs6RkGrWn0yCModbuICP8pz28?=
 =?us-ascii?Q?Blx5C8GloEeiFn1Zoh7cdXUiulry8tRlKkT6ACgoz0kN9pHM+vRLeHQKsMPn?=
 =?us-ascii?Q?vsl17bIREsaJoSYzu+f1zt8mjUcLnQj2/VHXOrG37xe2mAigbUtF6SMcKYLT?=
 =?us-ascii?Q?TJV4ZyYPjjBOY4WcWm/zcz6/vhwbw+ZCg23R5lI6HZA2mQL4HPTt79ugilz3?=
 =?us-ascii?Q?GBLJzg4JuuS5AKRYTC31WLqDFXBizlqJAyyaxgOg4+8ho7YQrmEQrA1eUMTE?=
 =?us-ascii?Q?E2u9TpkqYNwnFFBt1gvaSxdLHIhOdEE+x9loaOpzTKfITg3iKDH9TTU7uYDo?=
 =?us-ascii?Q?vVP3qHidlbo2e24kYtGQVmA+wKVHauUkU+fOiIVYQxhZmgm1gRvo936xFYWH?=
 =?us-ascii?Q?i0uJ91KkKPx4dcz81XtG46BYwYu6VeMZl/9B7U7k6PRcFwBvHms0CaBqvldK?=
 =?us-ascii?Q?hZshXfDuRVmlvlI3cX0fZqUUrJBicrRvKZ/BqPFywrKP4h0jydzfWj4QCMem?=
 =?us-ascii?Q?FCLeCUBayEaIqjiNqLrvLECZkHreVjuRkhERev21EgNLkzmdHmdWK+51v1MY?=
 =?us-ascii?Q?5Uno5wKaaxat4ArLpjmvMAQod/PYoLSZoAtHfKjcFVSqlh8ZkdlKVoVLOXuA?=
 =?us-ascii?Q?VRPxrRFRf8NUN1nHIK9GjlmAdDI1KY2aZSZQkyQpbbcbSY/MdftYpUk9cK7h?=
 =?us-ascii?Q?hq5l8GI0Gts+YTWu1+DKAgfX/jvmfx2vPSxRnBTu5pVagJeRGC7A25eltN9b?=
 =?us-ascii?Q?C3AAoTUNj3518m95f5OOv0EC9zjLr/GO3kuHgwbiYJBtQaCJAvZg5gp6UQs7?=
 =?us-ascii?Q?3Oj7MVXz7UOfjKLkl+xXb3l99e4xV3LPYuSH9dQLpuaGDrW8HDcUcipKWzvh?=
 =?us-ascii?Q?FKSnKsmvVHfWfNCPhNadf6dLr52Sx3jFkvXrqzKIPYOSpYprD4VA6nBaLKxa?=
 =?us-ascii?Q?QIrbgCs7O7yF5GfGxee8MRdOxg5F3SxrNdDJ9jfmwvDvlg7nmp9hJYPN7c3e?=
 =?us-ascii?Q?BSUm9F/C8KMxznR0Z/M9i0gl7Pevm8VltKNF/jZllP5dyTyhe78Ev6NnV3mz?=
 =?us-ascii?Q?6Ff+ERcz1NovfWh1dfp6t+Mdxnxar8pbVdv8YbTEqO8l8xHEFtfJHGn4v7hW?=
 =?us-ascii?Q?CdLIBGrKlaiPUBjDN/z6Z3Ln9QgBqABW7MJTJQizTM5sqpoWY0Ph7wat8wSW?=
 =?us-ascii?Q?AEh3aSN0OFoEafCN1LuqiQBpkUZZxuPJJmS/JG2m78DP4BqRSEz+uVYOrQNl?=
 =?us-ascii?Q?I+06lmEbaOVl113HY1JzgwhS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5144a6-035c-49ea-5b08-08d95115c84d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 15:47:04.4292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L9Q4GAt6ZhOH6ikei1M/wVBtSz290NxfqglponEY+9zO3GM4REASMV/jFmUOVY/GejfSaKgkfXTrLKfWXtoiBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB1308
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: l3IE5UfYmGqN5ljuvy1uHuzHOInvTsp2
X-Proofpoint-ORIG-GUID: l3IE5UfYmGqN5ljuvy1uHuzHOInvTsp2
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_10:2021-07-27,
 2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270094
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
Cc: "Pedrana, Nick" <allan.nic.pedrana@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Artem and all,

We are integrating smbios-mdr into our build.  Our SMBIOS info is downloade=
d and built as a file in the filesystem using proprietary means (our CHIF -=
 channel interface).  Our hope is that we can simply point the smbios-mdr s=
ervice at it and light up new information about the platform in dbus, Redfi=
sh, and the GUI.

However, I can't find much in the way of documentation about smbios-mdr.  I=
'm especially interested in how to extend the functionality past just CPUs =
and DIMMs into things like OEM records supplied by the BIOS.  Seems like th=
e possibilities are:

1. Smbios-mdr has a generic dbus API and we write an independent service to=
 query it for this info and publish to dbus
2. We create a generic extension mechanism for smbios-mdr for vendors to ad=
d OEM support and push to dbus directly from smbios-mdr (like w/ CPUs/DIMMs=
)
3. We fork smbios-mdr and extend it (not preferred).

I'd like to hear how best to leverage this recipe.

Thanks,

Mike
