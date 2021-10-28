Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F82343D9FE
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 05:50:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfs5x3DmBz2yPc
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 14:50:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=Hms73CWE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nuvoton.com (client-ip=40.107.131.58;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chma0@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=Hms73CWE; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310058.outbound.protection.outlook.com [40.107.131.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hfs5R63w3z2xrp
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 14:50:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuEY0JiGHHPPbAuMNGGPTf/PjixrRVkw5TKGzfwjMPNlweVI+UkAbEmqZjXiB33PzGbv+zCRLi95y26YAJYFih7liCj0Pg+8KwvCJwTKjkXVlf/2gaTpF7C/wA5vWOiGt3vosf5V9htM87mGH01m/tbVbKgG46rntgZ0F+6TUV1b4JGMQxO7kszvNR2gJYD+ukUpCwH3DkNdD7qeYkD8OvEiyRCVk9WtZl5cAkWgRfN5YnSzXTmZYuhc6Fo19VYIM7/arOJgMsmOID0hfZdp9KE5tSsMR3OmoKFdlIlZ/sHYdG5Jme71xSdiybLS3rZufKLcBVEPgcxhS0E9p9WweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0k6ZTSaDTDTTEWRWv3qdF1wSCSedcty+f3D+pgtVOcI=;
 b=MSMR5l2PN+z13HCATQbH5sBXdLeeuBarnMXwvZ4B9xlnnzJu8akz4j8+5hs29P7EMMw7nP2RYGfTyrRyqmjc2ObngYMY/XHsK6bflSPHDxDV7FKGPrq/u5Vvo56HlaAn/Z/uetWpDbL6sfo1yGc5ZiDYi9k6AL150bXenR9iK3N3sMZPK4cwI6MxuekavwVzrC41DVTADGfGCopUnHt7m26+TcA4uQeuOFmGsCvwNOgm8HHKuKn4KQCZrc4reYYRlKu6HTXQ3G60agASXvex+4Me97+WmyEb4zpl3fI95lc3kx1GVBF2uDg9sB0DpRkVbxOXHhWVdhD0jK/G/f+3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0k6ZTSaDTDTTEWRWv3qdF1wSCSedcty+f3D+pgtVOcI=;
 b=Hms73CWEGNUC/+YeL7c66v+y/YY9mI3z7Il/h8iCjSKcmMSSkR+l/11aohaABUFG+TbeCbkQbfzXhCrvA6OYYF9nrfp79EyX5jDUugNzS7VlUIdY31aml99kd9vopiaasCtqpq+TE531XsTYS6dPUbLo6bN9jKsDGjJYp4tnDCw=
Received: from HK0PR03MB3089.apcprd03.prod.outlook.com (2603:1096:203:42::22)
 by HK0PR03MB3490.apcprd03.prod.outlook.com (2603:1096:203:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.12; Thu, 28 Oct
 2021 03:49:45 +0000
Received: from HK0PR03MB3089.apcprd03.prod.outlook.com
 ([fe80::286b:ebae:e833:16ae]) by HK0PR03MB3089.apcprd03.prod.outlook.com
 ([fe80::286b:ebae:e833:16ae%5]) with mapi id 15.20.4649.014; Thu, 28 Oct 2021
 03:49:44 +0000
From: CS20 CHMa0 <CHMA0@nuvoton.com>
To: "edtanous@google.com" <edtanous@google.com>
Subject: RE: [phosphor-logging] About the "Stop emitting Entry propChanged
 before ifacesAdded" change reason
Thread-Topic: [phosphor-logging] About the "Stop emitting Entry propChanged
 before ifacesAdded" change reason
Thread-Index: AdfFhjh669KnwuGoRpm4ZK5IylzMDAAPsNYAAARZHgABdY/QoA==
Date: Thu, 28 Oct 2021 03:49:44 +0000
Message-ID: <HK0PR03MB3089BE72891D7A9798DD1AC8F5869@HK0PR03MB3089.apcprd03.prod.outlook.com>
References: <HK0PR03MB3089CFCA31102DE7BB551413F5BE9@HK0PR03MB3089.apcprd03.prod.outlook.com>
 <b71bb325-cf41-deab-5422-11520f85cc55@linux.ibm.com>
 <YXBPMNi5yzzEtE/R@heinlein>
In-Reply-To: <YXBPMNi5yzzEtE/R@heinlein>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9eec30a-6845-465c-10a8-08d999c5fb00
x-ms-traffictypediagnostic: HK0PR03MB3490:
x-microsoft-antispam-prvs: <HK0PR03MB3490BA04D73713EB747F1E48F5869@HK0PR03MB3490.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BfarD/Uhwqvxxz93Hw8efcP17XpZmW1ols/hfM7L23hlY3hhxcDB0lBvO+bOmf4ftqxQ6rLx8p5PXwjs31/m8kytvL0l30IwyPeGiW1nOqsPa874ThU15eKVR64+zPHimX6EqGQC5DXfLvRtYnXhRFCBik0Bg357XcTkknSuuiN4OAnHiLjWHEn0thT7JgEeqd0RpuBXhDyNAED3Twwke75CTFIIhnnCu/xVWiO3w44FJR3WMt7uqY+v2tDpG/5uAoRt9bU4zOU9re320VdcxC+kK/8EzkU08FZQ5BSjxlvxSJbiiSvltbbmb5Zmc1QUj/uOyOWQK8Kdx1MF3ZH1AbZui3GMu6+3D9XLDkIKrHhUgcOD7iclJ1Z1y7BLY2bQEA1AEiIr62b1fBzHOgHaTTx9i70i4Ivo+hhprj5H1W+DZrxoenOxzmKJ8gT/KqyclCJvKW8k+vEaPn9y/EOXn8XzQHJC1gvG2hyzAfvUxWOGxvA9z67dXtqbJGcgmcQwgFmbNsn8OpDR8zJQUJ4WfPnsMx+ij3B63ZSrZW9vyZyji70UGpsCQAL4AXfrMZkbjTsuqtcw51Kz6OBNSrMFGxrK9NP+zFZg/9wg0zLux91clUO4aycMueHXiIho65/kMI/dE/6GHQfIkbs+2FabIdHMzPPVk5BIpnFRXLag+vj5zfAR2hiIVdxGnXyx1N02+u1UUs7oNAfHF9/k8pGEgck2uHC8BolWmUWkHodqF0SI4+ctQyT5jgrJtYzT2QDNELS8AV+AuGLKZm/GXU2m8ekiurilkenZoZsTWORhuAs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3089.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(6916009)(7696005)(54906003)(6506007)(38070700005)(55016002)(52536014)(26005)(9686003)(71200400001)(53546011)(316002)(186003)(33656002)(4326008)(66946007)(83380400001)(76116006)(508600001)(2906002)(8936002)(5660300002)(122000001)(66446008)(966005)(66556008)(66476007)(8676002)(64756008)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?53NbfFYQTrZl7+41AUXYoqcBzGZp4P+IMsQGoh4AHHA3ABt/McEDEiqg1s?=
 =?iso-8859-1?Q?r4lysmv7DjfED7pRwnXNf2RPxehSLPA6tnCVwRo0q0YI2AcFOBfZ3QtnFX?=
 =?iso-8859-1?Q?/Vo/9s3Iuy6sZirPRZpDwoFzNuEU4LcjE4TnHBj0z0upUDuN0mukEc2Krs?=
 =?iso-8859-1?Q?bDBcR3/wU/KTqBRfyVcpsFvMW+LLWYXjfjC20u1hk4Te7LcW0GKbnIaiS8?=
 =?iso-8859-1?Q?w0wI2Q0m1egeL49HolNP/91i/+TTuLbeHCnqjdVZ6l009ZVcsQu6wBjEJ8?=
 =?iso-8859-1?Q?B/UY9fZ8316Sjf5rW7Z4hA0ekTpd5ASPd21vt9mw7worcwmQDINvOrz75A?=
 =?iso-8859-1?Q?QBM5RpEJeKN+rxr0Xa30GDRttdVsXOEXP41btv3mi+427cGQBNAwhiFKMc?=
 =?iso-8859-1?Q?UeYZ/0he5yR5ledtBW22YIQNQzPNcHUWGRlCLGE6CKe+bRw1GDEl2bg8IL?=
 =?iso-8859-1?Q?kJOExo8DPiVVS3T4cf2s1bF4HeYHB5jX5MsfyU9+XojiC0ZiKO+YaF73xs?=
 =?iso-8859-1?Q?i1nNlB0+9Y+h8BDufBxgjWaKJOQOOWdYLIO74o6X4xCWKpL7MjZaoPpAS1?=
 =?iso-8859-1?Q?Djta5MMs8ons725gV1wgyBFH5agnaSoW/WBjJRtpNpPev/V0i+E5pXMAyC?=
 =?iso-8859-1?Q?U26hWc0ITgCB4B4TNi03g/EdPtVvhqWBwmb3V5StqMD+41M9k5T1BHTJnJ?=
 =?iso-8859-1?Q?tPLP8Ngl1J+BvlXk1nkk5Wn1dvFLhjmbMhcEPlMuGwMWY7owBZWklaV3ES?=
 =?iso-8859-1?Q?LMYJ5OWyBDfFonTG4M+F+xM3N8lKV7Aro+ZH7oNqcpES+NU20Gw0rYQC/H?=
 =?iso-8859-1?Q?JMuGkOFDVndhFappRusB2nibpjiJHrhz0r4FsZ7WZjMiO7HK5ATnCpSdL6?=
 =?iso-8859-1?Q?u4rqYEUvtAlgHVEFN/pxQTjNni1FQs1J1wwFzOETEg1BtrHOzCMm+AuJUR?=
 =?iso-8859-1?Q?LRZ4CZsMDgUC1vGiVBZhBbyEfiI+xfCcknBxDy9KJfree1TFRolkARM5fb?=
 =?iso-8859-1?Q?HRfSf/oT7HoeigZakK2Lz5vl/+1ZHmPAYTmg05j2u6h53sTCrhfGkFJ28a?=
 =?iso-8859-1?Q?3ufZvPzHXTXRM+rw27gea2izJFz4FghtbQeFg8sxOD2K7Gy1yQydrTHNwG?=
 =?iso-8859-1?Q?Yk2MEtqa0H3LBa3kKAsL9XppganCbkUQlYwby6FC+4WNFyq2fSB+zIYV6p?=
 =?iso-8859-1?Q?NMSRvPxCqonyo84hAGub62q2KsPO/eIC6jdXNEwf5uQHRn0xJpQKX9KLLY?=
 =?iso-8859-1?Q?KfWCwrDJ9do/Wf2pWUEq8Brn05iDUU6hICX7x/xOYP3kkuJVxFSrN1k+DT?=
 =?iso-8859-1?Q?O79FJ2d2dChPhiSSff1uWMLGZtMPHhslLK5Z/hl/gHQOhssBhS8ou7bRch?=
 =?iso-8859-1?Q?jCtXoH+wJ4Bw0whFaq54NVKl61FrxtdnGgQO/7uxrHDxlKZsyx2DApANc/?=
 =?iso-8859-1?Q?uaD3/hxc+23svokKqXik97Xa5azQOlp+6eO3bk2M5bgS+5hvmqFCp8p0hl?=
 =?iso-8859-1?Q?n2zMoALNbwaOPoS6KQEw9GmLa6lc3xGWDzAf4vCmr1NqG4aE0EMMSig46/?=
 =?iso-8859-1?Q?3P3egqkddQ9iB47ixapiU/BMFdv1LML6KoOIR2tLA0Qd1x/HUAq0BOg29t?=
 =?iso-8859-1?Q?Btd9tHilokTYvHw06UrDwCx6J9DoKXl32Aveg8uVxVmsseHn/VReN5Hg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3089.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9eec30a-6845-465c-10a8-08d999c5fb00
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 03:49:44.7288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 78FM6w+NZFAaz+FNVtSekrGSprTxOxvcUUgmXRaJdhXO8vWIg1fAbuJYAcv0XJHGABNUA0fp/TDn1M+bsur0yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3490
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ed,
Before I upload the commit, I also consider revert the change in phosphor l=
ogging.
But I think it is reasonable to update bmcweb if it not used the good API.

-----Original Message-----
From: Patrick Williams [mailto:patrick@stwcx.xyz]
Sent: Thursday, October 21, 2021 1:18 AM
To: Matt Spinler <mspinler@linux.ibm.com>
Cc: CS20 CHMa0 <CHMA0@nuvoton.com>; openbmc@lists.ozlabs.org
Subject: Re: [phosphor-logging] About the "Stop emitting Entry propChanged =
before ifacesAdded" change reason

On Wed, Oct 20, 2021 at 10:13:06AM -0500, Matt Spinler wrote:
> values, and then explicitly emits the IA signal.   Others can chime
> in, but I didn't see it as proper D-Bus behavior to emit
> propertiesChanged before InterfacesAdded, since in fact no property is
> changing after the interface was added.

Correct.  PropertiesChanged signals should not show up before InterfacesAdd=
ed.

> It seems like every application does their own thing here, so maybe we
> can come up with some official best practices for how to emit signals
> for new interfaces (unless it's there and I missed it).

I'll admit the sdbusplus API is not great for this and a lot of application=
s do it wrong.  There was this issue on the backlog to come up with somethi=
ng
"better": https://github.com/openbmc/sdbusplus/issues/53

--
Patrick Williams
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
