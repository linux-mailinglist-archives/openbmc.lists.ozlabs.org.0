Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 037BF26329B
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 18:47:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmnx03qcZzDqX1
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 02:47:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0521e5341b=jorge.cisneros@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=oSPfhtyL; dkim-atps=neutral
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bmntc6615zDq8t
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 02:44:55 +1000 (AEST)
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089GKece004031; Wed, 9 Sep 2020 16:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=pps0720; bh=A39WP3E5rrpJEjyf3W0GUomT0IhmXWt3wRNmg+PBMtU=;
 b=oSPfhtyLMv6thHRkyJY5gYN0SWit+vXJFGpyUH/I59mI9yykf/lvRhWjgnuK4Rcj5K2i
 /DO8XqSE6+jtWaJ/miK+hP7AHlWREsWYaNooadxkvntWqGKzwtkSIUB2+nVVW6204D7L
 k/UmaSRVMfnGES2mdQ0XUGQ4fpsie2NbBXwoS/ACJHdO2NUlzpDtE86P8LfGKTHrodBG
 RfbNX0NN6KJWQ9334EZDnHhc4UTajNfiMC7NIXvVLvBSbtJo5dCXEc3Pg5m/RIeAiQQP
 D+YdxwQBOEAoTobw2LQni4315SKXpXEUDXaZbbFKcrvi2jwX7iz7+/BvuTlqH6kScBdz Mg== 
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com
 [15.241.140.73])
 by mx0b-002e3701.pphosted.com with ESMTP id 33excq2c0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 16:22:27 +0000
Received: from G4W9119.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net
 [16.210.20.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3427.houston.hpe.com (Postfix) with ESMTPS id 7EDF657;
 Wed,  9 Sep 2020 16:22:26 +0000 (UTC)
Received: from G9W8456.americas.hpqcorp.net (2002:10d8:a15f::10d8:a15f) by
 G4W9119.americas.hpqcorp.net (2002:10d2:14d6::10d2:14d6) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 9 Sep 2020 16:22:26 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (15.241.52.10) by
 G9W8456.americas.hpqcorp.net (16.216.161.95) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 9 Sep 2020 16:22:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dt45A4al9o4klnkV+oKg2YG5RIm7Kn6qJZYO4DHsJ5pCGXvXb+yqcJifE+93suKb6HGFcY8su/RAjET+ZVGapuRh3YJZgAmXBuf48oh+QN/exVLCBnzQsqGpHX70oOxCbKNdRts7oOadlYtroLGO1wP8pQDqxJmbkOfyRQerYdPotmupkPFu+yJAsIUsiMgJk4z/TyilrlxArLKxVVcFlWNcGX5SMQd0bfzHzDgywzCo2NWQ+vDuQzp4mD8DTuIZ49c277YAp9fjyvy69T1WWqbhm1dbtC/6JEtHytyy3uDZaYYqyy8Swm2DuOYiyqAeepxSEeC2C3iOnfq1cCt8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y88PPts6w2n6uYV9IjdrZR4tJctcXQBQfJVQh07/r9o=;
 b=lN3YPXThftKboIiQaajslyYWMP/FM1IjBWExyg2eIG1K9lh8XmxyvVyOmwWLR99HZ1f0PXzDWfeho6cfAc8sUlkTs0EYVUsQ/oGs/zGHfNT9Q2Mu+KQ0czkea/5whQdPpe7ck+9tmpLffADTM1ueTGejRBAL7W6SGUDkL3EwrLZ/S+anEC+6c8ExyQ0aP1ul3AeARM/zhKZQhVsxOkS8iqm5BFmd6X9+r2ieP/NPMOhM76BxWkkqHXl+5W7zvXXiNpiAV0vEusf1qcEklNcHl/qiRUI81TjZJ4wRe/kx/W0DlOTjyFX+lOa+P89nKtJU9aP+8m6/04ACtUL3rQzDTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7513::8) by CS1PR8401MB0551.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7514::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 9 Sep
 2020 16:22:25 +0000
Received: from CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::24e1:1bda:6de5:5b08]) by CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::24e1:1bda:6de5:5b08%9]) with mapi id 15.20.3370.016; Wed, 9 Sep 2020
 16:22:25 +0000
From: "Cisneros, Jorge (George)" <jorge.cisneros@hpe.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: FW: Request to add meta-hpe as subtree
Thread-Topic: FW: Request to add meta-hpe as subtree
Thread-Index: AdZ/wFscHWSEcHy2R5ekgo0hGzz1gQGLFjdAADD1LwAABTOnYA==
Date: Wed, 9 Sep 2020 16:22:25 +0000
Message-ID: <CS1PR8401MB0566075C0C7F8E4732F0A0B78F260@CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM>
References: <CS1PR8401MB0566CA9B0A0D168049F6D0E58F510@CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM>
 <CS1PR8401MB0566C7D5CDBC13FE4CFAEED68F290@CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM>
 <20200909135302.cnenc5joeyjdbkww@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20200909135302.cnenc5joeyjdbkww@thinkpad.dyn.fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none; fuzziesquirrel.com; dmarc=none action=none header.from=hpe.com; 
x-originating-ip: [98.194.85.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d28a53f5-e619-4001-3607-08d854dc89c8
x-ms-traffictypediagnostic: CS1PR8401MB0551:
x-microsoft-antispam-prvs: <CS1PR8401MB0551A2DD4AC34B2D0443779A8F260@CS1PR8401MB0551.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:126;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: APFrdTWu94bxpW4uMaRFAdB3IIfTzxrADpN6eS1zrL+lTfRPG5Al3NP+xhMk+kf8fKaQAOOTYK7f/GecnitUhsxvZfQsB17X1dOVX2NsczXZzP4uJaj9gcT6e9nEEI+9bqIu93h8N5JSy38CrKuTLPYCU3ieewoBQV6wlqay/IV/IqUDB3hysamzTl1Wjdlw0jUYeXnUypnbgZ4npPQNO6w6LWIaQ3VBXae3wP3kVouv1cB8EXzHSEcO56dOUW2KgOQSrBLR2DWeTl6MSq92FWGYFaT3j5clZAFp8YlqkDr5umNXKDxrZM9Mizv/WlHOuZmx5YpN8IejkVbkonuHjPO+vIRPNiw4h3hqZO0xGS9LKyRhUyP83D4J8AS8yQ6rzLCd3vK2bTDklXgi9AXT3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(396003)(39860400002)(136003)(71200400001)(86362001)(83380400001)(9686003)(99936003)(55016002)(4744005)(478600001)(6916009)(8936002)(52536014)(26005)(2906002)(4326008)(966005)(5660300002)(7696005)(8676002)(33656002)(316002)(186003)(66616009)(66556008)(64756008)(66946007)(6506007)(53546011)(76116006)(66446008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: U63gvXVDS8TKF7eBitNaiOIPfrB29kIoMlxiGzF23+1qaOcLfpYpBigo1MMQgMx4H0M3qpQH9M6IhpQGCH7OEUyYjBWSLS6jBEO7hlFGxZwWi26nQjmkd4KnQ6MH6Zk7oyzi4TQ4oY2BEBQeZtncaCorsqLCjIlAS4vg/lRbxYHeFs6TBIml30ge5BR0xsBMczYY6vLJ7iMQKI764wbACnLtcgPH1B9Nya/gXefkdydHWvWFl2ckdpmx9vgGPYyIMq6Dy/SuxEp+H7gZrkiF1MoU8lKYJLpkku6GUmZ/Vt0QWpr0/ZMxiPDQxdAOpVG2ZqnIqSzPveV7d2iKzmTxTvN34zA+4C4YCFja7dz38O6/VYBThjGFVsGHUA7GgTCj4VamzxiRGkgmz2Q+E91033YG/tmFddSPp+4MuJfyW+ZQiHOnC/odhjiP55cLIDgoPZZWWS8TbhKU7t85fxS5GaGIxIuSzodFreTJUtgAT5DSNy8C6vjefFT2G7XCvHAnFa6VOOP5/32pextoGdmEQr6B2Ga1rl/pjyLcgSshlso8/TKVwOnzn1eXqEUjcXzRvw/WnGG2vNOuldfb3LNQdGIPgPi7rSJOb8Ix8NzgdrAn9FwwjMzBUJwDj5c0O1Cl2ikfLCm+mfOioA2tflLogw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=SHA1; boundary="----=_NextPart_000_006B_01D6869B.7DAC3920"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB0566.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d28a53f5-e619-4001-3607-08d854dc89c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 16:22:25.3063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oRC5OPfwYONoAMHEoUfTrSQdbXXl+cenx+JGkCAl2+HRTP+LGRe5GEMpDorZ43OHVFTYcTQVmvxiKnt2NCOCPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB0551
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_09:2020-09-09,
 2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=945 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009090145
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

------=_NextPart_000_006B_01D6869B.7DAC3920
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks Brads!!


-----Original Message-----
From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com] 
Sent: Wednesday, September 9, 2020 8:53 AM
To: Cisneros, Jorge (George) <jorge.cisneros@hpe.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: FW: Request to add meta-hpe as subtree

On Tue, Sep 08, 2020 at 02:32:37PM +0000, Cisneros, Jorge (George) wrote:
>A kindly reminder, please help to add meta-hpe into openbmc as subtree, 
>thanks!

Hi Jorge

I finally got to this today:

https://urldefense.proofpoint.com/v2/url?u=https-3A__gerrit.openbmc-2Dprojec
t.xyz_c_openbmc_openbmc_-2B_36339&d=DwIBAg&c=C5b8zRQO1miGmBeVZ2LFWg&r=-dhLD1
BUi7mwjXMX2TrzZenygX_cUEMEiLV9V6sjjz0&m=_9PHizQYKWDZvUBCC1kqJ3LEoAf1S9UPqlaT
Ua3bl34&s=d_SdybYlx46hrzBXhCVbD9HUTmAmTtoIpHOIZXeg2r0&e= 

-brad

------=_NextPart_000_006B_01D6869B.7DAC3920
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
BHoweDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEUm9v
dEcyLmNybDA6oDigNoY0aHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElE
Um9vdEcyLmNybDCB0wYDVR0gBIHLMIHIMIHFBglghkgBhv1sBQIwgbcwKAYIKwYBBQUHAgEWHGh0
dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwgYoGCCsGAQUFBwICMH4MfEFueSB1c2Ugb2YgdGhp
cyBDZXJ0aWZpY2F0ZSBjb25zdGl0dXRlcyBhY2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5nIFBhcnR5
IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9ycGEtdWEwJwYD
VR0RBCAwHqQcMBoxGDAWBgNVBAMTD0RpZ2lDZXJ0UEtJLTMtMTANBgkqhkiG9w0BAQsFAAOCAQEA
X1nerrl1BXZsFMZla3hsjfUbITS1JJqv5VqARgBjdinDquRgauGZl7dCwqe2mTmspri0g9ZkYI9u
Rcc2Bxp62VIBFVPjQmRFidTi8bDGPzdwmfuQR11UPAvlZCT6D73oWWTusfIkadA6TBJVIGCXEWnM
ZqEySr9tLb+NGjwVe9I1Q8NArPScqUWM/8MM+W+sfMoqeP21Fl6J4LU9PHGrOKCEc4aHMS/cXVZU
9c5BVCh8Eu3Vctn+5QcK3CXxXWd35tieYmZjLYenwzJD/hGbdFHONQt3Wl97VkZAIviJ4av+IZbu
/cDa6hgVKY5c93X58/z1K1uc6n8Ltpe6dG9myDCCBpowggWCoAMCAQICEEGCTrf62yrKy++V3cIV
e38wDQYJKoZIhvcNAQELBQAwgasxCzAJBgNVBAYTAlVTMSswKQYDVQQKEyJIZXdsZXR0IFBhY2th
cmQgRW50ZXJwcmlzZSBDb21wYW55MTUwMwYDVQQLEyxDbGFzcyAyIE1hbmFnZWQgUEtJIEluZGl2
aWR1YWwgU3Vic2NyaWJlciBDQTE4MDYGA1UEAxMvSGV3bGV0dCBQYWNrYXJkIEVudGVycHJpc2Ug
Q29sbGFib3JhdGlvbiBDQSBHMjEwHhcNMTkwNzA4MDAwMDAwWhcNMjEwNzA3MjM1OTU5WjCBpzEs
MCoGA1UECgwjSGV3bGV0dCBQYWNrYXJkIEVudGVycHJpc2UgQ29tcGFueS4xJjAkBgNVBAsMHUVt
cGxveW1lbnQgU3RhdHVzIC0gRW1wbG95ZWVzMQ8wDQYDVQQLDAZTL01JTUUxFzAVBgNVBAMMDkpv
cmdlIENpc25lcm9zMSUwIwYJKoZIhvcNAQkBFhZqb3JnZS5jaXNuZXJvc0BocGUuY29tMIIBIjAN
BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4IqUICf5Us8s6PyqIl926cUCQKuxLVFk+5Qaw7Wj
azs84PL5yGoMOIJRY1Islfs4kLqx0XWFgVIMqXUNsOSAkSOvVOfc7EG4zAws8CycbjOtGbH3b8AT
Vk1eUS5tNOs7sfmP4GIT7k2BbEMg4VEUtuBx4BJIFzGGJWHrM6c6dtUxafLt+sB0+bimr8CqvYsP
6rOTfTVvIE7dgLlsrqCOdD27ZP2cZu5SlyNsdi6HLBuTTmmXO3D4H89hfBsEcuH0fqq2Lv1TNCwv
rmeQe710IJnAbGrPgw3rcRIVDv49YVUgwky3zyk7DcRKVxdxgnnikYiG714DB1ye45kQUBYYjQID
AQABo4ICujCCArYwDAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYI
KwYBBQUHAwQwHQYDVR0OBBYEFGrzk3JJl3n2PkzM4RZArJmA3uSoMCEGA1UdEQQaMBiBFmpvcmdl
LmNpc25lcm9zQGhwZS5jb20wgdIGA1UdIASByjCBxzCBxAYJYIZIAYb9bAUCMIG2MCcGCCsGAQUF
BwIBFhtodHRwOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwgYoGCCsGAQUFBwICMH4afEFueSB1c2Ug
b2YgdGhpcyBDZXJ0aWZpY2F0ZSBjb25zdGl0dXRlcyBhY2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5n
IFBhcnR5IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9ycGEt
dWEwXQYDVR0fBFYwVDBSoFCgToZMaHR0cDovL3BraS1jcmwuc3ltYXV0aC5jb20vY2FfOGZkZTU2
YmZkZDEwMmNlMDMwMjY4Njc2MjVkMDNiMWYvTGF0ZXN0Q1JMLmNybDA4BggrBgEFBQcBAQQsMCow
KAYIKwYBBQUHMAGGHGh0dHA6Ly9wa2ktb2NzcC5kaWdpY2VydC5jb20wHwYDVR0jBBgwFoAUFJlS
kglh0NGUMxEoPnytc73MTnEwQgYJKoZIhvcNAQkPBDUwMzAKBggqhkiG9w0DBzALBglghkgBZQME
AQIwCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBKjAuBgpghkgBhvhFARADBCAwHgYTYIZIAYb4RQEQ
AQICAQGCx+ajERYHMTA2MDQ1NjA5BgpghkgBhvhFARAFBCswKQIBABYkYUhSMGNITTZMeTl3YTJr
dGNtRXVjM2x0WVhWMGFDNWpiMjA9MA0GCSqGSIb3DQEBCwUAA4IBAQCVXK4Umi92MQi3sccdg8b8
uovGiUX9UhBgVwASwAhDxRTZfe/VpSfPEgUAhT007sRRYmit9/mx6/rvPRl00wLLGePXz3uSOA8X
M4VDPYnQGBxyUfcs0RDan4n3NHf4yDA+7FPwZa4bThqWA5b8MnKgY0SynxxwugG3fqDZClU3V95Y
ZTg+jzVIroFcy1X7Eau3YtyvgWw5bdixkXKBnwxL5qkADuY+EQsg27jVjXIGaI2AAgISolWVIr80
RHw3bqyy9MYRhtL2nsceQdDO/+UTxxM9bZqOHnHQaAB11KxnwSVjPejK+aY6Y1xynADlLarp9VDL
Bqp9vB5FpkQoLSAiMYIEiTCCBIUCAQEwgcAwgasxCzAJBgNVBAYTAlVTMSswKQYDVQQKEyJIZXds
ZXR0IFBhY2thcmQgRW50ZXJwcmlzZSBDb21wYW55MTUwMwYDVQQLEyxDbGFzcyAyIE1hbmFnZWQg
UEtJIEluZGl2aWR1YWwgU3Vic2NyaWJlciBDQTE4MDYGA1UEAxMvSGV3bGV0dCBQYWNrYXJkIEVu
dGVycHJpc2UgQ29sbGFib3JhdGlvbiBDQSBHMjECEEGCTrf62yrKy++V3cIVe38wCQYFKw4DAhoF
AKCCAp0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAwOTA5MTYy
MjI0WjAjBgkqhkiG9w0BCQQxFgQUe/hiZYcCE8T/ELkDezf8PxS1i9AwgZMGCSqGSIb3DQEJDzGB
hTCBgjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAoGCCqGSIb3DQMHMAsGCWCGSAFlAwQBAjAO
BggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAhowCwYJYIZIAWUDBAIDMAsGCWCG
SAFlAwQCAjALBglghkgBZQMEAgEwgdEGCSsGAQQBgjcQBDGBwzCBwDCBqzELMAkGA1UEBhMCVVMx
KzApBgNVBAoTIkhld2xldHQgUGFja2FyZCBFbnRlcnByaXNlIENvbXBhbnkxNTAzBgNVBAsTLENs
YXNzIDIgTWFuYWdlZCBQS0kgSW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBMTgwNgYDVQQDEy9IZXds
ZXR0IFBhY2thcmQgRW50ZXJwcmlzZSBDb2xsYWJvcmF0aW9uIENBIEcyMQIQQYJOt/rbKsrL75Xd
whV7fzCB0wYLKoZIhvcNAQkQAgsxgcOggcAwgasxCzAJBgNVBAYTAlVTMSswKQYDVQQKEyJIZXds
ZXR0IFBhY2thcmQgRW50ZXJwcmlzZSBDb21wYW55MTUwMwYDVQQLEyxDbGFzcyAyIE1hbmFnZWQg
UEtJIEluZGl2aWR1YWwgU3Vic2NyaWJlciBDQTE4MDYGA1UEAxMvSGV3bGV0dCBQYWNrYXJkIEVu
dGVycHJpc2UgQ29sbGFib3JhdGlvbiBDQSBHMjECEEGCTrf62yrKy++V3cIVe38wDQYJKoZIhvcN
AQEBBQAEggEArLvtxokFq4zw7oVUYr6DAjvc2MbBD4hQr9lFYwcKFwmNm8IxdGg/7Zk1h+/bdEi5
xYRl+8tF2TDMZoElYccNDnOl7I1OHckhy2SNz5/Hl8Kws1rC+NenUXO9IbBeRpvL1kksOUHDtqBY
GOjKdMxESERT3gh5/xBycCGn5S+QZPdsgcGKANGf9V3pUVfhJjQk8CZlJcbVEoIF8iFrr3V862zm
D12giVnDepWPDXdoYq7bvUdWrz/wwCGYXiKJNrdLIQWzd5Rps3mpG9QiWhs4qPGKdCHkQkdjGAFG
CyuxszcZBGVULwxzqFUte+amXrk3SWGYieycbBRGHcryskCmfAAAAAAAAA==

------=_NextPart_000_006B_01D6869B.7DAC3920--
