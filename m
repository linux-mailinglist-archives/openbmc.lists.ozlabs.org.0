Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A52983DBDF
	for <lists+openbmc@lfdr.de>; Fri, 26 Jan 2024 15:29:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VpVfvegb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TM0Sl1T5hz3cgP
	for <lists+openbmc@lfdr.de>; Sat, 27 Jan 2024 01:29:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VpVfvegb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2409::600; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=cmazieri@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2409::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TM0S62Rd4z3cVT
	for <openbmc@lists.ozlabs.org>; Sat, 27 Jan 2024 01:28:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ulxg7qiGXPInaHZY9Tclv7yRv9soPj9V2AQv3oZI83Y1PeA02lF9Q9uGS50xZXfGq00LIc6Yt8GZBOlAJ9ALk3y9nnrrfpph5VIbTgx60z9GT86rRSif+3IQC2FSu0EAVjprRVbWQmbFn58MPJhWgI5mgUuGYjQLFxVgc6kL5pRraQBBPHcnmP3iK8G4uJPhlxyJk9qJGe1xsf5eFnht6DWSbquB/15aIbjRSz1UDyXYbsaNtCLSYdg5jwIsrrFdo7a5GbAT1EayaP9VqmUV7LtYsX7PIT/PR263JQp94rJ+j6UM0GQ6b9amiAiyHZ+DGfRNvtPFDj7lUGZP4N8Pqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oi/bqvAEevP5c0Uqh94E4PMcNSGGwy4lrTlZFUIqOlM=;
 b=O2qv75SAd/PLKV0PDy1pth+e8sq/d/18YjsS2dnSZXSBesZMv+U7cl9OYWUHsnKhNnmTKgEgUs7T51h5IJfeetABRmysVRCvvriCb7lXDMCpsZeCtqXm8Ud40WOLzHdFk6ynYTp7sZnUImph8uvIMdcpf4k7a/pzWx0dErvRhXpdz3bitYXiD1OyODW6HEl3LK5S9rEaumnnHb9NclvcL0hvShx7zIdzlHoJcFqjw3Aqi4FImZQgLoIPePyT89oS7zaN3S0R1WDLHKfjBRj+POVEq/D7vswxT1gRtMW34jEZHApb2drrLEuFqwvyKvRoKs8OTBOimrM3i1FC8lchcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oi/bqvAEevP5c0Uqh94E4PMcNSGGwy4lrTlZFUIqOlM=;
 b=VpVfvegbK5+h1UT6fX6sou4nZtR/UNz7rzwHzulinsWPA10rEKiS8AGm78pj/DvCuK+ZUulmUimvoVIAP/tFY/h9mZ4XAkhy+pRdg2/eRGEiZvcAiQFHd5Paot5/Otedmcdfn0TO3WNLZi32UXO0arBssxLRlyQWBmL7FEoDBN4Y8GhWBQL2SBGCmJEGr/T6dsn+M9OCkji0lKpSy+BkuUvGMwqXz1uc0VOzzuemL5mcjfIl8aQdl4KWSCEMPLML5JUQNFFYBPYyXAbXbat37AmsZmBaxHhCLoFb4cKHSDOnoCoVixbU80Ptgo8xM0MgH/SH0X2Z0H+vCYL2Ole+2Q==
Received: from SN7PR12MB7276.namprd12.prod.outlook.com (2603:10b6:806:2af::8)
 by BL3PR12MB6619.namprd12.prod.outlook.com (2603:10b6:208:38e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 14:28:28 +0000
Received: from SN7PR12MB7276.namprd12.prod.outlook.com
 ([fe80::51ae:3275:fff0:e8a1]) by SN7PR12MB7276.namprd12.prod.outlook.com
 ([fe80::51ae:3275:fff0:e8a1%5]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 14:28:28 +0000
From: Carlos Mazieri <cmazieri@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Does SSE Notification on OpenBMC/BMCWEB work?
Thread-Topic: Does SSE Notification on OpenBMC/BMCWEB work?
Thread-Index: AQHaUGMmftLxbHjPlEWHadDInk5YkQ==
Date: Fri, 26 Jan 2024 14:28:28 +0000
Message-ID:  <SN7PR12MB7276AEA4876AFDC82758A6CAAA792@SN7PR12MB7276.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB7276:EE_|BL3PR12MB6619:EE_
x-ms-office365-filtering-correlation-id: ba39634c-3e78-4248-1d09-08dc1e7b103d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qwjT3whgLvqiGy2W1JX0+8Spj6hgX/j7t5Lux+5cl1DslYkIOhzxVc4/UtBgvxKK2gv5dr/Fei2vfv6dwKML0EoM99DyQuIi4AzfFeNGCytlJUTrLBjh3bhwIw+86Feb4//gy8FmtLhmxKuYhnXs+HffCSEDGkIJtcugKLhuUPxUzhuu/nnWp6tgBTNp29HGGIagVV7cBVG7b+fPl/YfFuyR26R4H3uY0efxa0IPG+QP38n+iIK9ylBTBCWYJuHYFDRXPDs0CYPxyPebNWcjwsErEgDgMS4Ckl+MvucmLyQXsEhyDp/5WUVd7hoW6BxXiJlyLutlP1uQK9kjIY5B9mb3iHoTXV0ZZAE04yVe05k8KVOLFGWhwOvLTuf54ijl+PoGniaI959k0StDl1gPiVRJL2mXkE8zG7kDbvKX9zzu4m5bHkhksgEQFkxG20SWeLh4vgeJgfEfpme6lwIy92O/DGq5EID2v50Rv9PC7t+lHVxp2HVCL2e11v19d+SlW4OPIQ12pm9F3Ggo2rfHVxlOdYd11Btvw+vvUuDhFxpyvirPMLoNnctAKinisHdRb6WdVUSsELq2YB39rOj1FMrsl0cw7D62wBb3mYknFIrjmvNtbUWB8nvKTRYI3375
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7276.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(41300700001)(38100700002)(166002)(76116006)(66556008)(66446008)(64756008)(66946007)(66476007)(316002)(6916009)(91956017)(86362001)(71200400001)(8936002)(8676002)(6506007)(7696005)(478600001)(1015004)(55016003)(19627405001)(966005)(15650500001)(52536014)(4744005)(33656002)(2906002)(5660300002)(66574015)(9686003)(38070700009)(83380400001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?ZjBuhutKGRk50PGBfjoNW83SdFxeYWFHjxx2ROt4KZLdJWM1vokh+tGDS0?=
 =?iso-8859-1?Q?TYP7GFYNOHYDJByToMPg13vF1ut3Fa9j+GZe1w747ofTJqVYDzI86mDEAm?=
 =?iso-8859-1?Q?yf45Mlu4LC7KWdNLZTRYZHq2N3/JXpM56R7MNmIo7OE/W0jQbV+kImV5pA?=
 =?iso-8859-1?Q?/moCmFoQgOcBHNjUizOesb9LEcWIuIt0qKlvauuFXv0VBhW3wNo77HmtXO?=
 =?iso-8859-1?Q?KNc2sJYZxVXES+kcQjqB629nxkRTshDfMMnCIlfQMUJt3L6lU1ET51cGo0?=
 =?iso-8859-1?Q?wLBMOOKhUtxghF/S/Cbt21aXHBu9ZHoeGZBARd2cfEv5335iweI582DqVL?=
 =?iso-8859-1?Q?Hi2C/glhQIM0+5u61+8K0t5qLpFKFxI23/E137GFNEbR7Dd+xgUAwSqPAh?=
 =?iso-8859-1?Q?bO20zI+cgB8v/7+tGSUvKDgIs6GxLiG1qFtqUtzaY2lpbP8GMhtIVuzioi?=
 =?iso-8859-1?Q?PJdAR8GecBfFDgcn0ZorPwpNaQtBNn4sZtIQjNsmRcu0PlDYC/RwfIm/x/?=
 =?iso-8859-1?Q?vrJ4+Iqzkv83T0Gih2vv0vSKMk9c6nOv0XPMep1a54KAmdjB8iK8WFVTlv?=
 =?iso-8859-1?Q?1OxUDuKNs0EEIDucuQemx3QxU5GJyR+IsNd23ChkxhJWW+EyU6DSpuhJC5?=
 =?iso-8859-1?Q?vh1+e3rMOdc3n6qxkBiealiWzHrOudtb2AZp/tS1FUKtZs09ScXM9Q4YPg?=
 =?iso-8859-1?Q?HXK57kbNQTTcYuqAVHijEcrKdMDbU44kDnyJZFxV2hYS5pJQ/7XGy3BHf5?=
 =?iso-8859-1?Q?UBnb1fhLXQHrwT/2xDGIX/Xj/+PsGn2zzXTo2KazoWMmZ7fEwVasZhP8Jz?=
 =?iso-8859-1?Q?NeqBdLwcU7xl0j4e46r6DtZH+3QKXKDcCC3TV86m95LpMIGjlj//DdgIB1?=
 =?iso-8859-1?Q?6Fz4GlTwOSd0ky9A8E/+x2BxvLLvMaQUOttx0Sm6EfodKCMraL5Rx7ECnp?=
 =?iso-8859-1?Q?w0ufHiBu/2HkFkkKZzGTb9nkUieD9UPwveWsabG1Hv4K12VW6/AGh3mEyp?=
 =?iso-8859-1?Q?7pGCJq9tk30lMc58Ycvat+qtM+tLD9+R4jMwwnKGV+2oko10zY4vZ6hb7X?=
 =?iso-8859-1?Q?4Jc5+oqI2XFTDSuxb8eo1HHNX+lof2wMoPKyRVQc4JSvfppAeyvK7q62Ru?=
 =?iso-8859-1?Q?uwtjsDblTppOkJNbBtZqs0EeRCslLZXjrCrAsTe/vQ6HtVbnaMHM8Onlrj?=
 =?iso-8859-1?Q?NmW65moxEdwK39hXiOjbgiJOKSrk3v2afoO5MGo2lj0b2JcimiTgBIFqsu?=
 =?iso-8859-1?Q?74WT3iSTAl1WZsREOqsS70MoEhxxvAzyYYbcwAemwLiphN3rG/flqf5u93?=
 =?iso-8859-1?Q?54HKzpNFnB6hPBa7/ZAnwlrpQ6NOjJDYwp2CsJibpUSQWUQ6UHHRjVW5AZ?=
 =?iso-8859-1?Q?2h0mKDPFelMQ1dDUZvNyIiNauTqkr+DV0hVFepGi57O782CioTbuZn1KYj?=
 =?iso-8859-1?Q?7HwZWb4PQ1O89WiZF2dP6NKDonpOeBfeu09C1vFmMUeZXcX3s125OADvZw?=
 =?iso-8859-1?Q?0xbORJgNHT5EKnE+v+iAlXsqYnOyxGyI6jXpFIHug73AjnLwvJVa66peUT?=
 =?iso-8859-1?Q?kq7B/JYFbyBqYigAT2oPIkYfDkmsf0HqarBe4pMJUupNCc5ygbmw6rWFR5?=
 =?iso-8859-1?Q?zZotP46Fai35OavtYNp0GX8pc7riuymKEK+Z0aBftOA4aLt9P+opM6Sbjr?=
 =?iso-8859-1?Q?DZrCsB0Mzv0sUqEZwKM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN7PR12MB7276AEA4876AFDC82758A6CAAA792SN7PR12MB7276namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7276.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba39634c-3e78-4248-1d09-08dc1e7b103d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 14:28:28.1728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cW69kmQixYiZnghJbLOUy6AwJg7Yx9sGjwq/IJGNC5ZcAIQD8z2crCZezQk5ZKWGuZziwl4vi+IC+YUU2D3RNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6619
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

--_000_SN7PR12MB7276AEA4876AFDC82758A6CAAA792SN7PR12MB7276namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
I am trying to test SSE using the machine Romulus on QEMU.
What I did to start is just point my browser to a such URL like https://loc=
alhost:18080/redfish/v1/EventService/SSE and I got "Not Found".
What I found interesting is, in the file "http/routing/sserule.hpp",  the m=
ethod handle() just sets the result as not found.
Here is the piece of the code:


class SseSocketRule : public BaseRule

{

    using self_t =3D SseSocketRule;




  public:

    explicit SseSocketRule(const std::string& ruleIn) : BaseRule(ruleIn) {}




    void validate() override {}




    void handle(const Request& /*req*/,

                const std::shared_ptr<bmcweb::AsyncResp>& asyncResp,

                const std::vector<std::string>& /*params*/) override

    {

        asyncResp->res.result(boost::beast::http::status::not_found);

    }
    ...
};


Can you guys confirm if SSE currently works on OpenBMC and if so how can I =
test it properly?

Thanks in advance ,
Carlos Mazieri

--_000_SN7PR12MB7276AEA4876AFDC82758A6CAAA792SN7PR12MB7276namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"letter-spacing: normal; font-f=
amily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, =
sans-serif; font-size: 12pt; color: black; font-weight: 400;">Hello,</span>=
</div>
<div class=3D"elementToProof"><span style=3D"letter-spacing: normal; font-f=
amily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, =
sans-serif; font-size: 12pt; color: black; font-weight: 400;">I am trying t=
o test SSE using the machine Romulus
 on QEMU.</span></div>
<div style=3D"text-align: left; background-color: rgb(255, 255, 255); margi=
n: 0px;">
<span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: black; font-weight: 400;">What I did to start is just point my browse=
r to a such URL like&nbsp;<a href=3D"https://localhost:18080/redfish/v1/Eve=
ntService/SSE" target=3D"_blank" id=3D"OWAc29ead20-6639-ae56-2044-05555e750=
1af" class=3D"OWAAutoLink" rel=3D"noopener noreferrer" data-auth=3D"NotAppl=
icable" data-linkindex=3D"0" style=3D"margin: 0px;">https://localhost:18080=
/redfish/v1/EventService/SSE</a>&nbsp;and
 I got &quot;Not Found&quot;.</span></div>
<div style=3D"text-align: left; background-color: rgb(255, 255, 255); margi=
n: 0px;">
<span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: black; font-weight: 400;">What I found interesting is, in the file &q=
uot;</span><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: black; background-color: yellow; font-weight: 400;">http/r=
outing/sserule.hpp</span><span style=3D"letter-spacing: normal; font-family=
: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-=
serif; font-size: 12pt; color: black; font-weight: 400;">&quot;,&nbsp;
 the method handle() just sets the result as&nbsp;</span><span style=3D"let=
ter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSe=
rvice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(237, 92,=
 87); font-weight: 400;">not found</span><span style=3D"letter-spacing: nor=
mal; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, =
Helvetica, sans-serif; font-size: 12pt; color: black; font-weight: 400;">.<=
/span></div>
<div style=3D"text-align: left; background-color: rgb(255, 255, 255); margi=
n: 0px;">
<span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: black; font-weight: 400;">Here is the piece of the code:&nbsp;</span>=
</div>
<div style=3D"text-align: left; background-color: rgb(255, 255, 255); margi=
n: 0px;">
<span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: black; font-weight: 400;"><br>
</span></div>
<table data-editing-info=3D"{&quot;topBorderColor&quot;:&quot;#ABABAB&quot;=
,&quot;bottomBorderColor&quot;:&quot;#ABABAB&quot;,&quot;verticalBorderColo=
r&quot;:&quot;#ABABAB&quot;,&quot;hasHeaderRow&quot;:false,&quot;hasFirstCo=
lumn&quot;:false,&quot;hasBandedRows&quot;:false,&quot;hasBandedColumns&quo=
t;:false,&quot;bgColorEven&quot;:null,&quot;bgColorOdd&quot;:&quot;#ABABAB2=
0&quot;,&quot;headerRowColor&quot;:&quot;#ABABAB&quot;,&quot;tableBorderFor=
mat&quot;:0,&quot;verticalAlign&quot;:&quot;top&quot;}" style=3D"text-align=
: left; background-color: rgb(255, 255, 255); box-sizing: border-box; borde=
r-collapse: collapse; border-spacing: 0px;">
<tbody>
<tr>
<td style=3D"text-align: left; border-width: 1px; border-style: solid; bord=
er-color: rgb(171, 171, 171); vertical-align: top; word-break: break-word; =
width: 577.17px; height: 382.97px; box-sizing: border-box;">
<div style=3D"text-align: left; margin: 0px;"><span style=3D"letter-spacing=
: normal; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Cali=
bri, Helvetica, sans-serif; font-size: 10pt; color: olive; font-weight: 400=
;"><br>
class</span><span style=3D"letter-spacing: normal; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 10pt; color: silver; font-weight: 400;">&nbsp;</span><span style=3D"le=
tter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontS=
ervice, Calibri, Helvetica, sans-serif; font-size: 10pt; color: purple; fon=
t-weight: 400;">SseSocketRule</span><span style=3D"letter-spacing: normal; =
font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helve=
tica, sans-serif; font-size: 10pt; color: silver; font-weight: 400;">&nbsp;=
</span><span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_Emb=
eddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: =
10pt; color: black; font-weight: 400;">:</span><span style=3D"letter-spacin=
g: normal; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Cal=
ibri, Helvetica, sans-serif; font-size: 10pt; color: silver; font-weight: 4=
00;">&nbsp;</span><span style=3D"letter-spacing: normal; font-family: Aptos=
, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; =
font-size: 10pt; color: olive; font-weight: 400;">public</span><span style=
=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFont, Aptos_M=
SFontService, Calibri, Helvetica, sans-serif; font-size: 10pt; color: silve=
r; font-weight: 400;">&nbsp;</span><span style=3D"letter-spacing: normal; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 10pt; color: purple; font-weight: 400;">BaseRul=
e</span></div>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: black; font-weight: 400;">{</span></div></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: silver; font-weight: 400;">&nbsp; &nbsp; </span><span style=3D"l=
etter-spacing: normal; font-size: 10pt; color: olive; font-weight: 400;">us=
ing</span><span style=3D"letter-spacing: normal; font-size: 10pt; color: si=
lver; font-weight: 400;">&nbsp;</span><span style=3D"letter-spacing: normal=
; font-size: 10pt; color: purple; font-weight: 400;">self_t</span><span sty=
le=3D"letter-spacing: normal; font-size: 10pt; color: silver; font-weight: =
400;">&nbsp;</span><span style=3D"letter-spacing: normal; font-size: 10pt; =
color: black; font-weight: 400;">=3D</span><span style=3D"letter-spacing: n=
ormal; font-size: 10pt; color: silver; font-weight: 400;">&nbsp;</span><spa=
n style=3D"letter-spacing: normal; font-size: 10pt; color: purple; font-wei=
ght: 400;">SseSocketRule</span><span style=3D"letter-spacing: normal; font-=
size: 10pt; color: black; font-weight: 400;">;</span></div></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: black; font-weight: 400;">=0A=
</span></div></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: silver; font-weight: 400;">&nbsp; </span><span style=3D"letter-s=
pacing: normal; font-size: 10pt; color: olive; font-weight: 400;">public</s=
pan><span style=3D"letter-spacing: normal; font-size: 10pt; color: black; f=
ont-weight: 400;">:</span></div></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: silver; font-weight: 400;">&nbsp; &nbsp; </span><span style=3D"l=
etter-spacing: normal; font-size: 10pt; color: olive; font-weight: 400;">ex=
plicit</span><span style=3D"letter-spacing: normal; font-size: 10pt; color:=
 silver; font-weight: 400;">&nbsp;</span><span style=3D"letter-spacing: nor=
mal; font-size: 10pt; color: purple; font-weight: 400;">SseSocketRule</span=
><span style=3D"letter-spacing: normal; font-size: 10pt; color: black; font=
-weight: 400;">(</span><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: olive; font-weight: 400;">const</span><span style=3D"letter-spac=
ing: normal; font-size: 10pt; color: silver; font-weight: 400;">&nbsp;</spa=
n><span style=3D"letter-spacing: normal; font-size: 10pt; color: purple; fo=
nt-weight: 400;">std</span><span style=3D"letter-spacing: normal; font-size=
: 10pt; color: black; font-weight: 400;">::</span><span style=3D"letter-spa=
cing: normal; font-size: 10pt; color: purple; font-weight: 400;">string</sp=
an><span style=3D"letter-spacing: normal; font-size: 10pt; color: black; fo=
nt-weight: 400;">&amp;</span><span style=3D"letter-spacing: normal; font-si=
ze: 10pt; color: silver; font-weight: 400;">&nbsp;</span><span style=3D"let=
ter-spacing: normal; font-size: 10pt; color: rgb(9, 46, 100); font-weight: =
400;">ruleIn</span><span style=3D"letter-spacing: normal; font-size: 10pt; =
color: black; font-weight: 400;">)</span><span style=3D"letter-spacing: nor=
mal; font-size: 10pt; color: silver; font-weight: 400;">&nbsp;</span><span =
style=3D"letter-spacing: normal; font-size: 10pt; color: black; font-weight=
: 400;">:</span><span style=3D"letter-spacing: normal; font-size: 10pt; col=
or: silver; font-weight: 400;">&nbsp;</span><span style=3D"letter-spacing: =
normal; font-size: 10pt; color: purple; font-weight: 400;">BaseRule</span><=
span style=3D"letter-spacing: normal; font-size: 10pt; color: black; font-w=
eight: 400;">(</span><span style=3D"letter-spacing: normal; font-size: 10pt=
; color: rgb(9, 46, 100); font-weight: 400;">ruleIn</span><span style=3D"le=
tter-spacing: normal; font-size: 10pt; color: black; font-weight: 400;">)</=
span><span style=3D"letter-spacing: normal; font-size: 10pt; color: silver;=
 font-weight: 400;">&nbsp;</span><span style=3D"letter-spacing: normal; fon=
t-size: 10pt; color: black; font-weight: 400;">{}</span></div></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: black; font-weight: 400;">=0A=
</span></div></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: silver; font-weight: 400;">&nbsp; &nbsp; </span><span style=3D"l=
etter-spacing: normal; font-size: 10pt; color: olive; font-weight: 400;">vo=
id</span><span style=3D"letter-spacing: normal; font-size: 10pt; color: sil=
ver; font-weight: 400;">&nbsp;</span><span style=3D"letter-spacing: normal;=
 font-size: 10pt; color: rgb(0, 103, 124); font-weight: 700;"><i>validate</=
i></span><span style=3D"letter-spacing: normal; font-size: 10pt; color: bla=
ck; font-weight: 400;">()</span><span style=3D"letter-spacing: normal; font=
-size: 10pt; color: silver; font-weight: 400;">&nbsp;</span><span style=3D"=
letter-spacing: normal; font-size: 10pt; color: olive; font-weight: 400;">o=
verride</span><span style=3D"letter-spacing: normal; font-size: 10pt; color=
: silver; font-weight: 400;">&nbsp;</span><span style=3D"letter-spacing: no=
rmal; font-size: 10pt; color: black; font-weight: 400;">{}</span></div></pr=
e>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: black; font-weight: 400;">=0A=
</span></div></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: silver; font-weight: 400;">&nbsp; &nbsp; </span><span style=3D"l=
etter-spacing: normal; font-size: 10pt; color: olive; font-weight: 400;">vo=
id</span><span style=3D"letter-spacing: normal; font-size: 10pt; color: sil=
ver; font-weight: 400;">&nbsp;</span><span style=3D"letter-spacing: normal;=
 font-size: 10pt; color: rgb(0, 103, 124); font-weight: 700;"><i>handle</i>=
</span><span style=3D"letter-spacing: normal; font-size: 10pt; color: black=
; font-weight: 400;">(</span><span style=3D"letter-spacing: normal; font-si=
ze: 10pt; color: olive; font-weight: 400;">const</span><span style=3D"lette=
r-spacing: normal; font-size: 10pt; color: silver; font-weight: 400;">&nbsp=
;</span><span style=3D"letter-spacing: normal; font-size: 10pt; color: blac=
k; font-weight: 400;">Request&amp;</span><span style=3D"letter-spacing: nor=
mal; font-size: 10pt; color: silver; font-weight: 400;">&nbsp;</span><span =
style=3D"letter-spacing: normal; font-size: 10pt; color: green; font-weight=
: 400;">/*req*/</span><span style=3D"letter-spacing: normal; font-size: 10p=
t; color: black; font-weight: 400;">,</span></div></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: silver; font-weight: 400;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; </span><span style=3D"letter-spacing: normal; font-size:=
 10pt; color: olive; font-weight: 400;">const</span><span style=3D"letter-s=
pacing: normal; font-size: 10pt; color: silver; font-weight: 400;">&nbsp;</=
span><span style=3D"letter-spacing: normal; font-size: 10pt; color: purple;=
 font-weight: 400;">std</span><span style=3D"letter-spacing: normal; font-s=
ize: 10pt; color: black; font-weight: 400;">::</span><span style=3D"letter-=
spacing: normal; font-size: 10pt; color: purple; font-weight: 400;">shared_=
ptr</span><span style=3D"letter-spacing: normal; font-size: 10pt; color: bl=
ack; font-weight: 400;">&lt;bmcweb::AsyncResp&gt;&amp;</span><span style=3D=
"letter-spacing: normal; font-size: 10pt; color: silver; font-weight: 400;"=
>&nbsp;</span><span style=3D"letter-spacing: normal; font-size: 10pt; color=
: rgb(9, 46, 100); font-weight: 400;">asyncResp</span><span style=3D"letter=
-spacing: normal; font-size: 10pt; color: black; font-weight: 400;">,</span=
></div></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: silver; font-weight: 400;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; </span><span style=3D"letter-spacing: normal; font-size:=
 10pt; color: olive; font-weight: 400;">const</span><span style=3D"letter-s=
pacing: normal; font-size: 10pt; color: silver; font-weight: 400;">&nbsp;</=
span><span style=3D"letter-spacing: normal; font-size: 10pt; color: purple;=
 font-weight: 400;">std</span><span style=3D"letter-spacing: normal; font-s=
ize: 10pt; color: black; font-weight: 400;">::</span><span style=3D"letter-=
spacing: normal; font-size: 10pt; color: purple; font-weight: 400;">vector<=
/span><span style=3D"letter-spacing: normal; font-size: 10pt; color: black;=
 font-weight: 400;">&lt;</span><span style=3D"letter-spacing: normal; font-=
size: 10pt; color: purple; font-weight: 400;">std</span><span style=3D"lett=
er-spacing: normal; font-size: 10pt; color: black; font-weight: 400;">::</s=
pan><span style=3D"letter-spacing: normal; font-size: 10pt; color: purple; =
font-weight: 400;">string</span><span style=3D"letter-spacing: normal; font=
-size: 10pt; color: black; font-weight: 400;">&gt;&amp;</span><span style=
=3D"letter-spacing: normal; font-size: 10pt; color: silver; font-weight: 40=
0;">&nbsp;</span><span style=3D"letter-spacing: normal; font-size: 10pt; co=
lor: green; font-weight: 400;">/*params*/</span><span style=3D"letter-spaci=
ng: normal; font-size: 10pt; color: black; font-weight: 400;">)</span><span=
 style=3D"letter-spacing: normal; font-size: 10pt; color: silver; font-weig=
ht: 400;">&nbsp;</span><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: olive; font-weight: 400;">override</span></div></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: silver; font-weight: 400;">&nbsp; &nbsp; </span><span style=3D"l=
etter-spacing: normal; font-size: 10pt; color: black; font-weight: 400;">{<=
/span></div></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: silver; font-weight: 400;">&nbsp; &nbsp; &nbsp; &nbsp; </span><s=
pan style=3D"letter-spacing: normal; font-size: 10pt; color: rgb(9, 46, 100=
); font-weight: 400;">asyncResp</span><span style=3D"letter-spacing: normal=
; font-size: 10pt; color: black; font-weight: 400;">-&gt;res.result(</span>=
<span style=3D"letter-spacing: normal; font-size: 10pt; color: purple; font=
-weight: 400;">boost</span><span style=3D"letter-spacing: normal; font-size=
: 10pt; color: black; font-weight: 400;">::</span><span style=3D"letter-spa=
cing: normal; font-size: 10pt; color: purple; font-weight: 400;">beast</spa=
n><span style=3D"letter-spacing: normal; font-size: 10pt; color: black; fon=
t-weight: 400;">::</span><span style=3D"letter-spacing: normal; font-size: =
10pt; color: purple; font-weight: 400;">http</span><span style=3D"letter-sp=
acing: normal; font-size: 10pt; color: black; font-weight: 400;">::status::=
not_found);</span></div></pre>
<pre style=3D"margin-top: 0px; margin-bottom: 0px;"><div style=3D"text-alig=
n: left; margin: 0px;"><span style=3D"letter-spacing: normal; font-size: 10=
pt; color: silver; font-weight: 400;">&nbsp; &nbsp; </span><span style=3D"l=
etter-spacing: normal; font-size: 10pt; color: black; font-weight: 400;">}<=
/span></div><div style=3D"text-align: left; margin: 0px;"><span style=3D"le=
tter-spacing: normal; font-size: 10pt; color: black; font-weight: 400;">&nb=
sp; &nbsp; ...</span></div><div style=3D"text-align: left; margin: 0px;"><s=
pan style=3D"letter-spacing: normal; font-size: 10pt; color: black; font-we=
ight: 400;">};</span></div></pre>
<div style=3D"text-align: left; margin: 0px;"><span style=3D"letter-spacing=
: normal; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Cali=
bri, Helvetica, sans-serif; font-size: 12pt; color: black; font-weight: 400=
;"><br>
</span></div>
</td>
</tr>
</tbody>
</table>
<div style=3D"text-align: left; background-color: rgb(255, 255, 255); margi=
n: 0px;">
<span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: black; font-weight: 400;"><br>
</span></div>
<div style=3D"text-align: left; background-color: rgb(255, 255, 255); margi=
n: 0px;">
<span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: black; font-weight: 400;">Can you guys confirm if SSE currently works=
 on OpenBMC and if so how can I test
 it properly?&nbsp;</span></div>
<div style=3D"text-align: left; background-color: rgb(255, 255, 255); margi=
n: 0px;">
<span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: black; font-weight: 400;"><br>
</span></div>
<div style=3D"text-align: left; background-color: rgb(255, 255, 255); margi=
n: 0px;">
<span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: black; font-weight: 400;">Thanks in advance ,</span></div>
<div style=3D"text-align: left; background-color: rgb(255, 255, 255); margi=
n: 0px;">
<span style=3D"letter-spacing: normal; font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: black; font-weight: 400;">Carlos Mazieri</span></div>
</body>
</html>

--_000_SN7PR12MB7276AEA4876AFDC82758A6CAAA792SN7PR12MB7276namp_--
