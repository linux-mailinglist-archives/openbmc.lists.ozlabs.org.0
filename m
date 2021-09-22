Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93882414B3D
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 15:58:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF0JX3pXRz2ymy
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 23:58:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=cd4Sq6ZB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=08996fca47=jean-marie.verdun@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=cd4Sq6ZB; dkim-atps=neutral
X-Greylist: delayed 2587 seconds by postgrey-1.36 at boromir;
 Wed, 22 Sep 2021 23:58:22 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF0Hy3Yj6z2xtR
 for <openbmc@lists.ozlabs.org>; Wed, 22 Sep 2021 23:58:20 +1000 (AEST)
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18MCfs70009409; 
 Wed, 22 Sep 2021 13:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=pps0720; bh=pwXqEf8Vcn+Ya1tbmT+s29F0k6f1Umu0aP8yxXY94RE=;
 b=cd4Sq6ZBEmylfqhTBGS/fgqeVMH5JQG73PWwGJCr9M2nq2ASmjb1EaVrUVi1UuNkfC3p
 hHB+BRk30mbbJ2E0wiO7fvzqdMi8lmZxHLA/2yZqFnhTQ309ZR3NpYpRu75Mog+P/S8O
 cDPdE5/Cpr3Mp6G8NGfrU/fuwk2bvXUbF1KODn4oEYEflPjZoBp8z2jW9htFm4rTbWWa
 lXXIKyC600R/VXanFgFAmemF0eWv6srlDRGFIouuOAgoj8gdBwk43FxtlyjxoW9d6fBV
 wSnuC+E8E1cwRuzDSXaos0dEWqedGpxdCFl97pf+F4WtOSdwg+fiHcF2GoRSactMT55F AQ== 
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com
 [15.241.140.73])
 by mx0b-002e3701.pphosted.com with ESMTP id 3b7q49nt7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 13:15:08 +0000
Received: from G9W9210.americas.hpqcorp.net (g9w9210.houston.hpecorp.net
 [16.220.66.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3427.houston.hpe.com (Postfix) with ESMTPS id C019C76;
 Wed, 22 Sep 2021 13:15:07 +0000 (UTC)
Received: from G9W9210.americas.hpqcorp.net (2002:10dc:429b::10dc:429b) by
 G9W9210.americas.hpqcorp.net (2002:10dc:429b::10dc:429b) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Wed, 22 Sep 2021 13:15:07 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (15.241.52.10) by
 G9W9210.americas.hpqcorp.net (16.220.66.155) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.18 via Frontend Transport; Wed, 22 Sep 2021 13:15:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ch9Dt4VDpFup/GAVBokZuh9DpFYsBfeSqmf3WNVBgZo9t27OYYfvQeTkJ3Jc/ftFHuFW+x5YF2HR0SwhRIhbGXQfKlt3zusUj1wPcqTaiyZJsoCmKkL6xphdA0rPDbZ4BwW5ZKbp0wplsRrS3L9za0+yUwgaQID9X05CrMX+OiPsnvGVA98XiySObVj3iKG99bfDOahMGSA6TmeftUih/WKpW0liGve1kAZr2AOC5ABPQDxtXUfoGMRl3Bxkt0bNhBITtg8P9I4c0m1Ik3iL7dcs6xIzN3ZFpGCorqdD8bmARluXlA1rcuHse/DnIYNl+B2U/dSgngo+LC8l+RSPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=5hWtB2fUUOTe702T9ww74TzBP5k+FkKk7j1nfnYmSF4=;
 b=lONBNxsUyOzvKqmevUUmsGStNX+jtAA3pNJcWlnYO5w9we/ugjv+6+C3YEqfgF0H0gglfAkmYdfTxRs6fDG8P4xMHbZwkoPk5+OBz5l2ahTxeexE03dv2kG74ixQwT3ld2pYy6fhywin1v4FpCH+jkSDH67Ln+H82inLpto9qIi9tY06xV2Abj71MMQNr/ehGKJ3FfIuhZ26i8ufh9BRGK9y7aTbtZuMk/YyXt/OZrIMVjoOSw3jFRYx7bR0ArO4LK0wW2nShGmZ7mH3wGh5UGVRjAP+0q/uLukE1sgVQtJtwaOeQ6nCC2EYmChggYaCbMyH6OtLo7JJwuW/0A7vEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from TU4PR8401MB0941.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7711::23) by TU4PR8401MB0415.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:770b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Wed, 22 Sep
 2021 13:15:05 +0000
Received: from TU4PR8401MB0941.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::1cd2:6512:3c5b:ef9b]) by TU4PR8401MB0941.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::1cd2:6512:3c5b:ef9b%5]) with mapi id 15.20.4544.014; Wed, 22 Sep 2021
 13:15:05 +0000
From: "Verdun, Jean-Marie" <jean-marie.verdun@hpe.com>
To: Alexander Amelkin <a.amelkin@yadro.com>, Ed Tanous <edtanous@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: New test for patches in openbmc/openbmc
Thread-Topic: New test for patches in openbmc/openbmc
Thread-Index: AQHXrzkngVCiqIA6/0ilq7kyaGEptauvwrcAgABEUfw=
Date: Wed, 22 Sep 2021 13:15:05 +0000
Message-ID: <TU4PR8401MB0941FF77A007DEB6DCB7B58BA7A29@TU4PR8401MB0941.NAMPRD84.PROD.OUTLOOK.COM>
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
 <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
In-Reply-To: <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 0199738a-d581-4f10-95b6-c6dfd53075c1
authentication-results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=hpe.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b912cec9-b6cd-4649-01de-08d97dcafea6
x-ms-traffictypediagnostic: TU4PR8401MB0415:
x-microsoft-antispam-prvs: <TU4PR8401MB04155337A43DD03C69588856A7A29@TU4PR8401MB0415.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V+fOupCBz7P7SFnhW8h6UO7mgwTrZX/EafL9CwWthdsySN9N/j9P3GPoClACfmxgPAFPixKqkx0prPnwakUb1iBcFG4uHMktnsJly2GANtxcoZaDqYZOxyihgV4WNwK1mrb9he9CrfW0l2bhyEP5UmQEMbhgsxEByCckArgLcQslqXPas+96h8QCmwtnMttZ27gFEQnuOL1pJ01NQEmcNOGnjYlS1RU+/9GwW3+sDBn/o+znOQpuhV07DyBRdKQ1ubQKtaXziREgn8851MsYPHj13YN9rOpgcS9gnUgrPKkuVCcuWRkj1K08v0B0lL4CRPmhd/MOhXxsN3z7LS13jzkzyxl0gvnwjyyUesLT2PklRNPWYr/Uqd6q6XGASjtm1cIVUmJXtfv2X0LDtqe4CLXYUYIc8q4eR4GXDlOFTGBtDZOOsHYYJICt/vQcoG+i6TdCFpN97H/ILi50YxbScOI+8aGmoKIe1MFC4NNyOmF+jj/T5ozAzrzgpDVz1YNR6XM12CUUyS/PGdnHo7MfimXWOFQf/zYtfhKAbW0QPWWtfVtv4w78jG4X6nz1AR8LWnFz2UaT0PY/bOPSWNNOr1Wp3MuJBn13k6LHOftptiEuVm9NLbuzyRQCF5FjLSYPhByLb3jbay3asFzr55eLZ6BPo8uivYKxAzLclfCEkPQBm8AncNjle+ftkOJHofoTQErCdgSBi0Hj2elCTF4G6PAaUIMsSMeijDOvnbTYFjlz0ceXIO5O6RbMsKo6iVzBXewlO66TOsD6/nnk5TJlaXSA2Xxymae/4EaxpRI2P9g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TU4PR8401MB0941.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(316002)(86362001)(508600001)(66556008)(38070700005)(66946007)(76116006)(66476007)(19627405001)(8676002)(64756008)(66446008)(966005)(33656002)(2906002)(166002)(122000001)(38100700002)(7696005)(110136005)(55016002)(71200400001)(53546011)(9686003)(83380400001)(52536014)(186003)(6506007)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?koi8-r?Q?4OAwQyNMKQKGZ2Ml5aOrULE0FygoDgKK+UrufSV6x6F0tu+WDfwnzMFJlwTUly?=
 =?koi8-r?Q?wCamAW6C3aK/4a4lszuHZ20c8HN+Y+SdOS7Fj2cHb6zLeyktzlZk8j4hV3/2Br?=
 =?koi8-r?Q?cJ4DkDiLs5yk1pF8SEbvTfdI6Cjr7QzSGQjEKLYzE6m9JXB0dLO7TKGQCIcI6T?=
 =?koi8-r?Q?5vxoKHD8CAeY37QCAhjGuTfxh2pQAo3wTugUvGqovW2ew/aK2Zxh1sBmlYVLJe?=
 =?koi8-r?Q?M1UsmWJfHpB++eTqJQkESf5bozQqyQ/QA+zzgAn4Vqhfg2+LVEB+3wTDE0s6X3?=
 =?koi8-r?Q?WmACo5YogkDuiAOG93V9LMPt90zzsG4sv+ygnMAYHKwiWXPmDyWDpQjeUz89Ub?=
 =?koi8-r?Q?Enxwfq3uRAQejbZ9+Q4DKiuVdXQm4RmEmeR+Q0ZS0HPymPWu1Vya3f1FC2e7Qt?=
 =?koi8-r?Q?59eRYl+eR3mGbNnC7BLrbaaD8C8KkcxY2BHgQB/+yqu9DrYijzeQR3HDK/3FrR?=
 =?koi8-r?Q?6Ix2GDDh5D3c+bpCUp2kzoXcU5L44N0osGn2TUJBV8IRxP6gebRHPiTH5+QyKD?=
 =?koi8-r?Q?BAe0/UrDrwFMLzwzz8qUx2SdJio576RZlQRSL+qYVB9jpbECFuL+BBYZXNa36h?=
 =?koi8-r?Q?GlRKK1po6tf0CjzAvycgdzDt1zuCIh32Lde2P40gzycTD6TDxBgnVpnkAfT7tI?=
 =?koi8-r?Q?fIejWPRnPvJUekH8EBn+UPCtJ3CPO+e2mMbrKDPS7lCPaM1PiJqiCxK8QAP8ny?=
 =?koi8-r?Q?k+uWdsr6/F8fCXdB0ZEtIAWkNYd64a4w2xUp0ausbWekBOgCEV1TyoBUZm/g9w?=
 =?koi8-r?Q?mgkmEY5m2QSg4buzv8k9czyfScsbvcc1BedjZ/CeuRrAvf354oKeBlO50esnos?=
 =?koi8-r?Q?Lf8woryKkSMyjuJuvKzNEPCTQoEkGDJcRUYH7e1hmVpuTJNiPhzGVkduQ8RsRr?=
 =?koi8-r?Q?uqVZq0mLpFX4KqHPan3pPp5Azzi4sS1vWq1SKcsIMhkFXzhHsK/3+iApHXNjmW?=
 =?koi8-r?Q?fnUvBvnfmD3i4lkxr4C5yk31Ak3amWn5ZS4bLgfPOlLuacUkkIGRD187Kk8iP1?=
 =?koi8-r?Q?QwcER34cFsD03xA8sEZtyL92FrgSaR8HDi5ukWDhqr+xI5Pw+3G2SlmnWfn8wZ?=
 =?koi8-r?Q?LIvo8ewtATTchgQHvunxpQvhp5z2lQPfxnmDnbk/UF/n9G1+ClM0pXmZbCpTnW?=
 =?koi8-r?Q?4JpDesSa9RqTy0NuYm1ylyF1BeV6i2iNE8TkJLMn/O+2wB/YCj2BQaFD3p6FVR?=
 =?koi8-r?Q?AN4Jc0xxNlJRTEFNKp9q/+hMaIPdfC/qNue8vfEHt4qYYysBCWtzWCXxQyF4WV?=
 =?koi8-r?Q?B0h3C2uEWfrZSWvyTIROLQZlsHdEOGqMsfkOxrIoTUpp43UiONxg6kzheUDFUb?=
 =?koi8-r?Q?Wq2nqbP4eCC4bxR0obq0Oe0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_TU4PR8401MB0941FF77A007DEB6DCB7B58BA7A29TU4PR8401MB0941_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TU4PR8401MB0941.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b912cec9-b6cd-4649-01de-08d97dcafea6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2021 13:15:05.8024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6MLqpGHCn1Ykx5Uq5KWve1SQwuO6DwclFTiwhNSMmiv3ihlFrOvi02ADc+Cc5MMz+tP2YKoL3jmbU+eFf01KaZabrivup147GLnB5tA2VFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TU4PR8401MB0415
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: OBInyrLEldlyGT1zES7_8ASGB9pYYP4B
X-Proofpoint-GUID: OBInyrLEldlyGT1zES7_8ASGB9pYYP4B
X-Proofpoint-UnRewURL: 4 URL's were un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-22_04,2021-09-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109200000
 definitions=main-2109220093
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

--_000_TU4PR8401MB0941FF77A007DEB6DCB7B58BA7A29TU4PR8401MB0941_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

We face the same challenges at HPE and spent some time discussing with code=
 maintainers. I must admit that i had the same position than the one you ar=
e taking. But while processing some of our patches, upstreaming them can he=
lp enhancing the code and maintainability, by introducing new abstraction l=
ayers which are providing interfaces to vendor specific requirements. It is=
 not always the case, but a good example could be found within the iKVM cod=
e, which is tightly coupled to Aspeed currently.

Our situation is even worse as we do have our own BMC asic, we do not use A=
speed. So how to integrate a bunch of hardware specific code into something=
 which is specific to somebody else. We need to re-architecture part of the=
 code. It is a pain, but part of the game. It would have been better if the=
 code had been thought from the beginning to be more modular or with wider =
open mind. But in many cases, learning by mistake is also a good way to bui=
ld something great. It was about the same regarding the x86-power managemen=
t where we have GPIOs which are not compatible with upstream. So we had to =
propose enhancement and modifications.

With that said, it is going to be a huge effort for hardware vendors, but I=
 think we need to do it even if that is going to be boring and complicated.

What worries me is the time required to do that, and avoid breaking the dyn=
amic. I do not recommend forking, this is a massive pain to maintain.

Jean-Marie

________________________________
From: openbmc <openbmc-bounces+jean-marie.verdun=3Dhpe.com@lists.ozlabs.org=
> on behalf of Alexander Amelkin <a.amelkin@yadro.com>
Sent: Wednesday, September 22, 2021 5:02 AM
To: Ed Tanous <edtanous@google.com>; OpenBMC Maillist <openbmc@lists.ozlabs=
.org>
Subject: Re: New test for patches in openbmc/openbmc

Hi Ed!

Most patches you listed (at least those for YADRO) are
platform specific and no repository will accept them for
a general audience.

No vendor, I'm confident, is willing to spend endless time
persuading maintainers to include vendor-specific or
platform-specific patches into their repositories.

For instance,
meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for-bo=
ot-initiator-mailbox.patch
is there because our customers demand this feature and we failed
proving to openbmc maintainers that this is a needed feature
and not a "security threat" or something. We honestly tried for months.

On the other hand,
meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-positio=
n-support.patch
is strictly hardware-specific and is not needed as is for other
vendors or platforms, and we don't have time to make it a
generic solution. If we ever do have that time, we will surely
push the developed generic solution to the appropriate
repository.

What you propose now will force vendors to move farther away
from upstream and create their own forks of openbmc where
they will not even try to upstream their changes and will just drift
farther and farther away.

Is that what you really pursue or did I get your idea wrong?
So far it looks to me like a destructive decision.

WBR, Alexander.

22.09.2021 01:35, Ed Tanous =D0=C9=DB=C5=D4:
> A few new features have been merged into CI that will now disallow
> .patch files within most meta layers.  This is due to a significant
> number of them popping up in both reviews and in the repo itself,
> despite having documented rules to the contrary.  The hope here is to
> better codify our rules, and give very quick response to submitters
> about the right procedure so we can encourage getting patches in
> faster, and keep machines buildable against master.  As the patches
> state, meta-phosphor is still allowed to contain patch files as an
> escape hatch, if the community decides it's required.
>
> The patchsets in question are here:
> https://gerrit.openbmc-project.xyz/q/repotest
>
> And add some ability for us to make more of these expectations for
> meta layers codified in the future.
>
> The script itself is here:
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/scripts/run-=
repotest.sh
> and is runnable on any tree prior to submitting to CI.  We currently
> have the following patches in meta layers.
>
> meta-amd/meta-ethanolx/recipes-x86/chassis/x86-power-control/0001-Amd-pow=
er-control-modifications-for-EthanolX.patch
> meta-ampere/meta-common/recipes-devtools/mtd/mtd-utils/0001-flashcp-suppo=
rt-offset-option.patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0001-aspeed-scu-Sw=
itch-PWM-pin-to-GPIO-input-mode.patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0002-aspeed-Disabl=
e-internal-PD-resistors-for-GPIOs.patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-suppor=
t-passing-system-reset-status-to-kernel.patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0004-aspeed-add-gp=
io-support.patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0005-aspeed-Enable=
-SPI-master-mode.patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0006-aspeed-suppor=
t-Mt.Jade-platform-init.patch
> meta-aspeed/recipes-bsp/u-boot/files/default-gcc.patch
> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0001-bytedanc=
e-g220a-Enable-ipmb.patch
> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0003-misc-asp=
eed-Add-Aspeed-UART-routing-control-driver.patch
> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0004-ARM-dts-=
aspeed-Add-uart-routing-node.patch
> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0005-ARM-dts-=
aspeed-Enable-g220a-uart-route.patch
> meta-bytedance/meta-g220a/recipes-phosphor/ipmi/phosphor-node-manager-pro=
xy/0001-Remove-Total_Power-sensor.patch
> meta-facebook/meta-bletchley/recipes-bsp/u-boot/u-boot-aspeed-sdk/0001-u-=
boot-ast2600-57600-baudrate-for-bletchley.patch
> meta-facebook/meta-tiogapass/recipes-bsp/u-boot/u-boot-aspeed/0001-config=
s-ast-common-use-57600-baud-rate-to-match-Tiog.patch
> meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0001-board=
-aspeed-Add-Mux-for-yosemitev2.patch
> meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0002-spl-h=
ost-console-handle.patch
> meta-google/dynamic-layers/nuvoton-layer/recipes-bsp/images/npcm7xx-igps/=
0001-Set-FIU0_DRD_CFG-and-FIU_Clk_divider-for-gbmc-hoth.patch
> meta-google/recipes-extended/libconfig/files/0001-conf2struct-Use-the-rig=
ht-perl.patch
> meta-google/recipes-extended/libconfig/files/0001-makefile-Add-missing-LD=
FLAGS.patch
> meta-google/recipes-phosphor/initrdscripts/obmc-phosphor-initfs/rwfs-clea=
n-dev.patch
> meta-ingrasys/meta-zaius/recipes-bsp/u-boot/u-boot-aspeed/0001-board-aspe=
ed-Add-reset_phy-for-Zaius.patch
> meta-nuvoton/recipes-bsp/images/npcm7xx-igps/0001-Adjust-paths-for-use-wi=
th-Bitbake.patch
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0001-Add-system-reset-sta=
tus-support.patch
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0002-config-ast-common-se=
t-fieldmode-to-true.patch
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0003-aspeed-add-gpio-supp=
ort.patch
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-posit=
ion-support.patch
> meta-yadro/meta-nicole/recipes-kernel/linux/linux-aspeed/0001-Add-NCSI-ch=
annel-selector.patch
> meta-yadro/meta-nicole/recipes-phosphor/host/op-proc-control/0001-Stop-an=
d-send-SRESET-for-one-thread-only.patch
> meta-yadro/recipes-phosphor/dbus/phosphor-dbus-interfaces/0001-Add-boot-i=
nitiator-mailbox-interface.patch
> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0001-Add-support-for-=
persistent-only-settings.patch
> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for-=
boot-initiator-mailbox.patch
> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0003-Fix-version-pars=
ing-update-AUX-revision-info.patch
>
> If you are a maintainer of these meta layers, please work to get these
> patches submitted to the correct repositories using their prefered
> review (email for linux/u-boot, gerrit for phosphor repos).
>
> Thanks,
>
> -Ed

--_000_TU4PR8401MB0941FF77A007DEB6DCB7B58BA7A29TU4PR8401MB0941_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Alexander,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
We face the same challenges at HPE and spent some time discussing with code=
 maintainers. I must admit that i had the same position than the one you ar=
e taking. But while processing some of our patches, upstreaming them can he=
lp enhancing the code and maintainability,
 by introducing new abstraction layers which are providing interfaces to ve=
ndor specific requirements. It is not always the case, but a good example c=
ould be found within the iKVM code, which is tightly coupled to Aspeed curr=
ently.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Our situation is even worse as we do have our own BMC asic, we do not use A=
speed. So how to integrate a bunch of hardware specific code into something=
 which is specific to somebody else. We need to re-architecture part of the=
 code. It is a pain, but part of
 the game. It would have been better if the code had been thought from the =
beginning to be more modular or with wider open mind. But in many cases, le=
arning by mistake is also a good way to build something great. It was about=
 the same regarding the x86-power
 management where we have GPIOs which are not compatible with upstream. So =
we had to propose enhancement and modifications.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
With that said, it is going to be a huge effort for hardware vendors, but I=
 think we need to do it even if that is going to be boring and complicated.=
&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
What worries me is the time required to do that, and avoid breaking the dyn=
amic. I do not recommend forking, this is a massive pain to maintain.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jean-Marie</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openbmc &lt;openbmc-b=
ounces+jean-marie.verdun=3Dhpe.com@lists.ozlabs.org&gt; on behalf of Alexan=
der Amelkin &lt;a.amelkin@yadro.com&gt;<br>
<b>Sent:</b> Wednesday, September 22, 2021 5:02 AM<br>
<b>To:</b> Ed Tanous &lt;edtanous@google.com&gt;; OpenBMC Maillist &lt;open=
bmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> Re: New test for patches in openbmc/openbmc</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Ed!<br>
<br>
Most patches you listed (at least those for YADRO) are<br>
platform specific and no repository will accept them for<br>
a general audience.<br>
<br>
No vendor, I'm confident, is willing to spend endless time<br>
persuading maintainers to include vendor-specific or<br>
platform-specific patches into their repositories.<br>
<br>
For instance, <br>
meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for-bo=
ot-initiator-mailbox.patch<br>
is there because our customers demand this feature and we failed<br>
proving to openbmc maintainers that this is a needed feature<br>
and not a &quot;security threat&quot; or something. We honestly tried for m=
onths.<br>
<br>
On the other hand, <br>
meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-positio=
n-support.patch<br>
is strictly hardware-specific and is not needed as is for other<br>
vendors or platforms, and we don't have time to make it a<br>
generic solution. If we ever do have that time, we will surely<br>
push the developed generic solution to the appropriate<br>
repository.<br>
<br>
What you propose now will force vendors to move farther away<br>
from upstream and create their own forks of openbmc where<br>
they will not even try to upstream their changes and will just drift<br>
farther and farther away.<br>
<br>
Is that what you really pursue or did I get your idea wrong?<br>
So far it looks to me like a destructive decision.<br>
<br>
WBR, Alexander.<br>
<br>
22.09.2021 01:35, Ed Tanous =D0=C9=DB=C5=D4:<br>
&gt; A few new features have been merged into CI that will now disallow<br>
&gt; .patch files within most meta layers.&nbsp; This is due to a significa=
nt<br>
&gt; number of them popping up in both reviews and in the repo itself,<br>
&gt; despite having documented rules to the contrary.&nbsp; The hope here i=
s to<br>
&gt; better codify our rules, and give very quick response to submitters<br>
&gt; about the right procedure so we can encourage getting patches in<br>
&gt; faster, and keep machines buildable against master.&nbsp; As the patch=
es<br>
&gt; state, meta-phosphor is still allowed to contain patch files as an<br>
&gt; escape hatch, if the community decides it's required.<br>
&gt;<br>
&gt; The patchsets in question are here:<br>
&gt; <a href=3D"https://gerrit.openbmc-project.xyz/q/repotest">https://gerr=
it.openbmc-project.xyz/q/repotest</a>
<br>
&gt;<br>
&gt; And add some ability for us to make more of these expectations for<br>
&gt; meta layers codified in the future.<br>
&gt;<br>
&gt; The script itself is here:<br>
&gt; <a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-phospho=
r/scripts/run-repotest.sh">https://github.com/openbmc/openbmc/blob/master/m=
eta-phosphor/scripts/run-repotest.sh</a><br>
&gt; and is runnable on any tree prior to submitting to CI.&nbsp; We curren=
tly<br>
&gt; have the following patches in meta layers.<br>
&gt;<br>
&gt; meta-amd/meta-ethanolx/recipes-x86/chassis/x86-power-control/0001-Amd-=
power-control-modifications-for-EthanolX.patch<br>
&gt; meta-ampere/meta-common/recipes-devtools/mtd/mtd-utils/0001-flashcp-su=
pport-offset-option.patch<br>
&gt; meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0001-aspeed-scu=
-Switch-PWM-pin-to-GPIO-input-mode.patch<br>
&gt; meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0002-aspeed-Dis=
able-internal-PD-resistors-for-GPIOs.patch<br>
&gt; meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-sup=
port-passing-system-reset-status-to-kernel.patch<br>
&gt; meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0004-aspeed-add=
-gpio-support.patch<br>
&gt; meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0005-aspeed-Ena=
ble-SPI-master-mode.patch<br>
&gt; meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0006-aspeed-sup=
port-Mt.Jade-platform-init.patch<br>
&gt; meta-aspeed/recipes-bsp/u-boot/files/default-gcc.patch<br>
&gt; meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0001-byted=
ance-g220a-Enable-ipmb.patch<br>
&gt; meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0003-misc-=
aspeed-Add-Aspeed-UART-routing-control-driver.patch<br>
&gt; meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0004-ARM-d=
ts-aspeed-Add-uart-routing-node.patch<br>
&gt; meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0005-ARM-d=
ts-aspeed-Enable-g220a-uart-route.patch<br>
&gt; meta-bytedance/meta-g220a/recipes-phosphor/ipmi/phosphor-node-manager-=
proxy/0001-Remove-Total_Power-sensor.patch<br>
&gt; meta-facebook/meta-bletchley/recipes-bsp/u-boot/u-boot-aspeed-sdk/0001=
-u-boot-ast2600-57600-baudrate-for-bletchley.patch<br>
&gt; meta-facebook/meta-tiogapass/recipes-bsp/u-boot/u-boot-aspeed/0001-con=
figs-ast-common-use-57600-baud-rate-to-match-Tiog.patch<br>
&gt; meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0001-bo=
ard-aspeed-Add-Mux-for-yosemitev2.patch<br>
&gt; meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0002-sp=
l-host-console-handle.patch<br>
&gt; meta-google/dynamic-layers/nuvoton-layer/recipes-bsp/images/npcm7xx-ig=
ps/0001-Set-FIU0_DRD_CFG-and-FIU_Clk_divider-for-gbmc-hoth.patch<br>
&gt; meta-google/recipes-extended/libconfig/files/0001-conf2struct-Use-the-=
right-perl.patch<br>
&gt; meta-google/recipes-extended/libconfig/files/0001-makefile-Add-missing=
-LDFLAGS.patch<br>
&gt; meta-google/recipes-phosphor/initrdscripts/obmc-phosphor-initfs/rwfs-c=
lean-dev.patch<br>
&gt; meta-ingrasys/meta-zaius/recipes-bsp/u-boot/u-boot-aspeed/0001-board-a=
speed-Add-reset_phy-for-Zaius.patch<br>
&gt; meta-nuvoton/recipes-bsp/images/npcm7xx-igps/0001-Adjust-paths-for-use=
-with-Bitbake.patch<br>
&gt; meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0001-Add-system-reset-=
status-support.patch<br>
&gt; meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0002-config-ast-common=
-set-fieldmode-to-true.patch<br>
&gt; meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0003-aspeed-add-gpio-s=
upport.patch<br>
&gt; meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-po=
sition-support.patch<br>
&gt; meta-yadro/meta-nicole/recipes-kernel/linux/linux-aspeed/0001-Add-NCSI=
-channel-selector.patch<br>
&gt; meta-yadro/meta-nicole/recipes-phosphor/host/op-proc-control/0001-Stop=
-and-send-SRESET-for-one-thread-only.patch<br>
&gt; meta-yadro/recipes-phosphor/dbus/phosphor-dbus-interfaces/0001-Add-boo=
t-initiator-mailbox-interface.patch<br>
&gt; meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0001-Add-support-f=
or-persistent-only-settings.patch<br>
&gt; meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-f=
or-boot-initiator-mailbox.patch<br>
&gt; meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0003-Fix-version-p=
arsing-update-AUX-revision-info.patch<br>
&gt;<br>
&gt; If you are a maintainer of these meta layers, please work to get these=
<br>
&gt; patches submitted to the correct repositories using their prefered<br>
&gt; review (email for linux/u-boot, gerrit for phosphor repos).<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; -Ed<br>
</div>
</span></font></div>
</body>
</html>

--_000_TU4PR8401MB0941FF77A007DEB6DCB7B58BA7A29TU4PR8401MB0941_--
