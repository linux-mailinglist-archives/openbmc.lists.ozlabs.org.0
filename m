Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B75756AFC8D
	for <lists+openbmc@lfdr.de>; Wed,  8 Mar 2023 02:56:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWb504WBqz3cd6
	for <lists+openbmc@lfdr.de>; Wed,  8 Mar 2023 12:56:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=ffOZ2EWp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com; envelope-from=prvs=0429f77271=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=ffOZ2EWp;
	dkim-atps=neutral
X-Greylist: delayed 160 seconds by postgrey-1.36 at boromir; Mon, 06 Mar 2023 18:35:25 AEDT
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVVjT4N89z3bgW
	for <openbmc@lists.ozlabs.org>; Mon,  6 Mar 2023 18:35:24 +1100 (AEDT)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3262AJmY012303
	for <openbmc@lists.ozlabs.org>; Mon, 6 Mar 2023 07:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : content-type : mime-version; s=pps0720;
 bh=kWMJPz3lKSianez95KLXNxQ66COkvdJP2JU5dpP+TRM=;
 b=ffOZ2EWp/pNdsdtHpdIEgbhEdL8KGjOJo9W49MQRkcLSbJK/Ekfk1TVILqqNx7uEb5qn
 aodJ5radWrhdHGGpVBJDaCE/3QT9edZIpq8AMTlPrcvnSwO4saUWAKhIKPFj6H3w9nOj
 iotznl9BYGkDhhDih0RNlC7WTWswVRVW5RZh3vS7Z42jPikKBRoCSJi3MNT7ifcfLp90
 fDztbmW9tQXnZvQ5ECUuizJEjyL9MFe5VM5b8ttjPDScSKtoEWDKxjBLvay0ZMU8JQz1
 lv1vo7N6nIuAqzZtzSN5d1quAVO9+sChyIMAcKOWMlesZOmBdBhJqyozEh1/e+QDgN/e KA== 
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3p417hkhv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 06 Mar 2023 07:32:39 +0000
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 63D79805E17
	for <openbmc@lists.ozlabs.org>; Mon,  6 Mar 2023 07:32:38 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sun, 5 Mar 2023 19:32:37 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36
 via Frontend Transport; Sun, 5 Mar 2023 19:32:37 -1200
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 6 Mar 2023 07:32:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlA1CCwkH9IqDcvmkK81LDHZ5t3zJNvad55IK4l/3QLP312C8caf27Ysy60ZKgNlcdZ00p2K6ayaXo1uaYfImk5QAFsVBqEdhWZW5OdV73X808PNsMytE8gJ4SGsflEVqxevrrV7Y6yz+oUcwkiiLzbzbMezU7TVVwjp+quMOpuJ1G0o4MGMoEwuCyEWjCSITIgJBk3voG5H7gJBfOGSbC2gNPFbaQUIIIGRoat1au/092S/sEIXvcuJuJrjOkrt0NvXFdX6IeliP2NSireXNkemxuElUMBQ/TK/VazbBOaNKebLC7rTGnoR71dxoRM+zDeWctr9YTInpIGzmQTHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWMJPz3lKSianez95KLXNxQ66COkvdJP2JU5dpP+TRM=;
 b=LWQ7g6Q5Atwxds38cqmMQ+rEpCmD/8ylx4qcoqwh+5NBhhKLZRBcqZP275DMl6oLMsRX0gT55vEikQ5MTl2fJh72ZINLygfSYVPUELjq7vDANj/tphbO6b/mzx/6YGegVR99dVhtBQQxghcE7sM7kqQBeOuTEnSllfLSOBrXEMHKW+4XS76bam7lGOCuFS7TlpgQt7vb4HWX5f6+3kOw94oLLPLLIyFtVLbT8+rRqZ/cyiUzg+eA6v+UCrl4pFZRIsaVnG8JtYIyTH8LVfdWhA3AUPDyz2puYoJS0lMzxDV9hgtMl9V/t+A4RWRLjUnorM8o8Vwam+vDGKw6D0Ap2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from SJ0PR84MB2088.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:437::8)
 by MW5PR84MB1523.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 07:32:30 +0000
Received: from SJ0PR84MB2088.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::17b8:37c7:2172:3dbf]) by SJ0PR84MB2088.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::17b8:37c7:2172:3dbf%4]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 07:32:30 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: storage_common: Support ISO files greater than 2.1GB
Thread-Topic: storage_common: Support ISO files greater than 2.1GB
Thread-Index: AdlP+k+ynXVrVPF5TgOGivToWs4Chg==
Date: Mon, 6 Mar 2023 07:32:30 +0000
Message-ID: <SJ0PR84MB2088C60886AF27A4FD918E9DD8B69@SJ0PR84MB2088.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR84MB2088:EE_|MW5PR84MB1523:EE_
x-ms-office365-filtering-correlation-id: d3c0fcae-645e-4696-ef12-08db1e14f1a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +qYup+ObuqkKK3FeZlo9mgsCBNH5rtThiaxyeaymQmDFo/cSBXSm0hio5orTaxKYA3hk749HPya1M57v10JUTKyFEpR2PE4sd21KhjjdDkMWj0qjlMwoKMXjesOt9shjUmjgw5X+clyKI5N1aso87izp2SsckrCjm6CeS9/6Nk1Y5lXH2b+fKGT1Avv8lFiASPV/vMlmE7MG7FM9QQjxCtIjqHVcm7pnklEbMQNdUEB4xpKxP4rysDuEz0R6hwQvc6HZfgM8fJ66p1F86j10c1JROKDq40IgYHKkIlTZVK9XWHJJj2TVp58M+e0zICEr5r5oNIbstGAF8UXk3FaVs/dSvwtsaox/9x7nWeYhhYehXlPuU5CKiSiLvWtrMzS+CAxUg8boB/KoqOuy2zoB1jbL6IEi1vxy5zL4idtrKNJk3vacoAx1OS3MTTsJ1KvU0XUpDBM+z0bAOxbdZCMxYEogy5i/SwLUlUjmykfMW0iMgfRm2Qvl4xkrNLK7pv1TZpG7Acla3FrTotUsKTwBjdKX+dzEvWBZTqpSdz8meDs+PSdI4FbMLxexdlsOGuRQstrugdZxY7j2BSk2hytdQ7UeEkJCYLm5HT53D7vjoodY0rjZ6bAXag4E1wRNja8IYlpcqXamEFm9O4SKlfQiHYD+5if4EZFbt34GHLIK3raI/J4HSnK7LfVBWh9PMGC8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR84MB2088.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199018)(966005)(316002)(83380400001)(55016003)(33656002)(86362001)(9686003)(186003)(82960400001)(2906002)(76116006)(5660300002)(66556008)(9326002)(8936002)(66446008)(6916009)(8676002)(66946007)(41300700001)(66476007)(478600001)(6506007)(26005)(64756008)(71200400001)(7696005)(122000001)(166002)(52536014)(38100700002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sSn4UTuTG1owCNKurC1ZjzymjgcFeV6o1D5oqXNmlha0/m3ujyrJw1plYYQu?=
 =?us-ascii?Q?F8RuDeVxvOxT3D/dF+oVFntCJMRshwAWiEPZgl1cbKyUhxR+RPS83v+XuLXt?=
 =?us-ascii?Q?1OMX5I94aqigJV4QPJd0yBOEyx9QmCw36reWQtI+tkVHNBe5zRLXyWNSbOCI?=
 =?us-ascii?Q?SUlmBajQ5anQtkmfOiUDzU/FDKAhHaHyMPZknBV+4VERznoaBVQsZ+aCx5QV?=
 =?us-ascii?Q?+ez8xXOI4IPHeVlAb/creGyYq1ypQdlanwnkAEBV1cFFL5rMo2gAd8hvCB1c?=
 =?us-ascii?Q?y9uWixakTADRS2R1L1FOKLXHsXkHkCcs89gRJj/iRZW3kO63qqPctR/6vCWY?=
 =?us-ascii?Q?cbsiRZzSf6Ski2K3P5f3yu6KFhHOIy4S5ABxL0Jm8UADBgDMhl0ckxRXeJL6?=
 =?us-ascii?Q?tGao55F9gx7jkvzzmqrp/AKCS6n1VsRK+vfQHecfowlFSFAxtm4E0XeWQT3V?=
 =?us-ascii?Q?H+PQZLLzuuOyMMvcLAAR3HYa/+C8mPvHuCHRQVx6CmduatsxfiFk/86jYC2N?=
 =?us-ascii?Q?cRZtzGxQnL5nPOGvTrJM4gEr+dvXpBPHOeRyAK0cZU5IuQCUMFcEuwC2exE4?=
 =?us-ascii?Q?BN4war3zrCU24wsPaH3e8AaczrHQY4BCvbZnz5/zCrc4pX1HganZn8dgvF6h?=
 =?us-ascii?Q?t/DZbmV05pFR+I8LtKEgS5lWi/zqPD/jozcxmunyf17W8GNl4jh5svdExyJt?=
 =?us-ascii?Q?fkTLNb927P1bZDsSVyxCc3aK34aaZ4Qg79oWZuapeyKJQxsKmNWXrUDyw/zf?=
 =?us-ascii?Q?96ffiiVLM3fqGZiiwPbHzkA9BBTHLZyigoldrMi/c5WxdJ4yNcNzJePVY96K?=
 =?us-ascii?Q?6MfEZHtd5Hvnz2lKtP8dUXQ93WgfjM34eIzXzLVikL/SoE4IdIBROMMghRFX?=
 =?us-ascii?Q?yy9FGOqsQkzdrYjwob//FDGmhZUpuWAwzZV4OJ8TJiBUUVVG0vc//INqyaUi?=
 =?us-ascii?Q?xqZfFpmaTOP3XSBl4P1f/HO6GlJZW+FVwGcekN15yfpK/8BPE/riL9BvFLX1?=
 =?us-ascii?Q?bKfSjSqhTqlvuagsXE0D9Xm9LHE14Sgq0xhXJCcloWt9yNRTwrke2b0xSkNI?=
 =?us-ascii?Q?6ABhAt8ZCpgF4XsJqt82hQBv6XgfaGGBHPJ/cJDpdg2RG7cxdknBLs/2S8e4?=
 =?us-ascii?Q?UTIBX3obLEDelmDdAWFXEYT6Bv6ednwxsTgG0YLm6qgkhKOzQxfemqf70MaP?=
 =?us-ascii?Q?EvcD7HcafXg21SFQw2m9UIac/HuG6vpl8T92g/YifmVCVfxOMZOdW3SWRrE1?=
 =?us-ascii?Q?bDzx/k1Nd0XJi2E1YriRsVoyTxWUgkw6/+mx5sxp9RyELVH1JOYpHgYZdaOi?=
 =?us-ascii?Q?Hs0Q2tvUHm+FaBJlKTmFTi0W8/rLTv4iN+00pDFmC3XEvDlhZR50LJsvdXXa?=
 =?us-ascii?Q?8RTSLXvWHZNDDLChDNec65cjZf1i75cHBXn9CvAS/Ef3wF5UNA26C2xDXSSv?=
 =?us-ascii?Q?Hi467TDWp9NPjJOAP/vJ7I2FRXDEoPOsU0hZ4Mx0CpTETjdVQ+r66AJ53EJG?=
 =?us-ascii?Q?Ibbm8Me/RK+wpKXLrH5IypGT186jAloY+qiZdSEPyoeVVBWVGIoZb0VQFsOh?=
 =?us-ascii?Q?JazRBKSrw/A14Lu6+e5+MBMnznXveeNCCkPgB2my?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR84MB2088C60886AF27A4FD918E9DD8B69SJ0PR84MB2088NAMP_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR84MB2088.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c0fcae-645e-4696-ef12-08db1e14f1a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 07:32:30.5263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KapyB7afogkaQFA7RM7QVvvQb9sgw4ORaw86h7PT4rYZUr+vfNRdL+hqGU+MXsUFBe0+JBNIsn+nVP6INJG7oaJpK2V51nnbLC7SuWqZO3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1523
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: stnbvPC6wZLUk6O2DazXx0HZA6tpfDsE
X-Proofpoint-ORIG-GUID: stnbvPC6wZLUk6O2DazXx0HZA6tpfDsE
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-05_12,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 mlxlogscore=961 lowpriorityscore=0 impostorscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060064
X-Mailman-Approved-At: Wed, 08 Mar 2023 12:55:33 +1100
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

--_000_SJ0PR84MB2088C60886AF27A4FD918E9DD8B69SJ0PR84MB2088NAMP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

When booting from virtual media with a Windows Installation ISO file (>8GB)=
, I have found it fails to install due to this code in drivers/usb/gadget/f=
unction/storage_common.c<https://github.com/torvalds/linux/blob/master/driv=
ers/usb/gadget/function/storage_common.c#:~:text=3Dmin_sectors%20%3D%201%3B=
-,if%20(curlun%2D%3Ecdrom)%20%7B,%7D,-if%20(num_sectors%20%3C%20min_sectors=
>:

        if (curlun->cdrom) {
               min_sectors =3D 300;     /* Smallest track is 300 frames */
               if (num_sectors >=3D 256*60*75) {
                       num_sectors =3D 256*60*75 - 1;
                       LINFO(curlun, "file too big: %s\n", filename);
                       LINFO(curlun, "using only first %d blocks\n",
                                      (int) num_sectors);
               }
        }


Removing this if-statement allows the Windows installation to proceed succe=
ssfully.

It leaves me wondering that given ISO files readily exceed these limits, wh=
at is the purpose of this if-statement? What unwanted side-effects might I =
experience by removing this code?

FWIW, I found old references for this topic:

  *   https://lkml.org/lkml/2015/3/11/852
  *   https://lists.ozlabs.org/pipermail/openbmc/2021-June/026820.htmlOpenB=
MC

The discussion in the first link highlights that the limits are probably th=
ere for audio-CD (as it emulates a CD-Player). I only need this to work for=
 data-CD. Though, if a general solution is needed, the USB Gadget driver wo=
uld need to distinguish between data-CD and audio-CD.

Thanks,
Matt.


--_000_SJ0PR84MB2088C60886AF27A4FD918E9DD8B69SJ0PR84MB2088NAMP_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1822504547;
	mso-list-type:hybrid;
	mso-list-template-ids:1486899796 691726860 134807555 134807557 134807553 1=
34807555 134807557 134807553 134807555 134807557;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:54.0pt;
	text-indent:-18.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:90.0pt;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:126.0pt;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:162.0pt;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:198.0pt;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:234.0pt;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:270.0pt;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:306.0pt;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:342.0pt;
	text-indent:-18.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When booting from virtual media with a Windows Insta=
llation ISO file (&gt;8GB), I have found it fails to install due to this co=
de in
<a href=3D"https://github.com/torvalds/linux/blob/master/drivers/usb/gadget=
/function/storage_common.c#:~:text=3Dmin_sectors%20%3D%201%3B-,if%20(curlun=
%2D%3Ecdrom)%20%7B,%7D,-if%20(num_sectors%20%3C%20min_sectors">
drivers/usb/gadget/function/storage_common.c</a>:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-GB">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (curlun-&gt;cdrom) {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-GB">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; min_secto=
rs =3D 300;&nbsp;&nbsp;&nbsp;&nbsp; /* Smallest track is 300 frames */<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-GB">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num_s=
ectors &gt;=3D 256*60*75) {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-GB">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_sectors =3D 256*60*75 - 1;<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-GB">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINFO(curlun, &quot;file too big: %s=
\n&quot;, filename);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-GB">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINFO(curlun, &quot;using only first=
 %d blocks\n&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-GB">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (int) num_sectors);<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-GB">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-GB">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Removing this if-statement allows the Windows instal=
lation to proceed successfully.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It leaves me wondering that given ISO files readily =
exceed these limits, what is the purpose of this if-statement? What unwante=
d side-effects might I experience by removing this code?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">FWIW, I found old references for this topic:<o:p></o=
:p></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-list:l0 leve=
l1 lfo1"><a href=3D"https://lkml.org/lkml/2015/3/11/852">https://lkml.org/l=
kml/2015/3/11/852</a><o:p></o:p></li><li class=3D"MsoListParagraph" style=
=3D"margin-left:18.0pt;mso-list:l0 level1 lfo1"><a href=3D"https://lists.oz=
labs.org/pipermail/openbmc/2021-June/026820.htmlOpenBMC">https://lists.ozla=
bs.org/pipermail/openbmc/2021-June/026820.htmlOpenBMC</a><o:p></o:p></li></=
ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The discussion in the first link highlights that the=
 limits are probably there for audio-CD (as it emulates a CD-Player). I onl=
y need this to work for data-CD. Though, if a general solution is needed, t=
he USB Gadget driver would need to
 distinguish between data-CD and audio-CD.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Matt.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ0PR84MB2088C60886AF27A4FD918E9DD8B69SJ0PR84MB2088NAMP_--
