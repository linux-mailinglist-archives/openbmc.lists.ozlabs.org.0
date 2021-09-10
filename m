Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C8940688E
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 10:36:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5Tk203Vkz2yXc
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 18:36:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=gp3DvpP6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=088761d2b9=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=gp3DvpP6; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5TjV1MG5z2yMP
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 18:35:56 +1000 (AEST)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18A5Nf8L022606; 
 Fri, 10 Sep 2021 08:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=Q0EF+ubUrnrbBQ75Y8QRdAL8E2j5rp0NwUYjkfnbIIs=;
 b=gp3DvpP6GS0Mf5u75CPkciiGUyC5OCcTC3lXszGemHLrGtIyS0ui2kRiqGB7RgIpKt5x
 ZWNt16Z7JUH1extlqOW0o8GcOzXxYfr4ZnGQTMBNDM0Gl87D/a3kBOhuqQsb/TCsdyf8
 EY44HvBpYlWdl1t/lreR21lJyfJFIMjkGrLEwP1+rebC0Nmt63CpMK4pI8U+tzXSEjkc
 map8Pn/tNdzHITBISMOtRTDUdKwP9YSj1W7wZsrF+8gaynVnVtDC2vOcZZZurrRNw7yO
 8C8lJpH1VvOfKk4YQ1QFJtPTraEfv6nY00AuFY75r1Tu34ApmhoJ7bKHjyYvDSGL5oGO Aw== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by mx0a-00268f01.pphosted.com with ESMTP id 3ayu0n1np0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 08:35:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tml7lOvdxbzEeNhfr8GdzEZJZSeypN0eSo0ZUsH+UWjJHGexupoz+sxkQ3oD/F1Flcr1BFIJDPwzdzSs1e9+GGHsUjU9XsMN9UL+MvSQN52TOtiBFhTW3lgMzDzX44dUJfezA8ScPRNJ3MwI04FxSeIEtJC2Yi8I24qFJ13LA0C/1EX8gy5SuGZXHlSqXYUdgdPZthWgO6AKPbwTN+fsdGK3XphF62X8leXa9JUN1vUHgOb9yjGDU2kzzC4QIvIbmVWECHnFa9/WqjbH/CYiyVxeuUqWJvz20OoWDQawfTvra2akfsYH7499XiXcYpVnuuoR/s0Rx49/lg3HHIrPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Q0EF+ubUrnrbBQ75Y8QRdAL8E2j5rp0NwUYjkfnbIIs=;
 b=g12O8Gri0x9kdIK9Ax+VWlATQiCiLAjQMkpUD5o5CRxFQiR3mKFdDAn+qrMeybNRdlHlfatKbIzEM1nh67GB+ho92XMENV7f1ZQM+gpWP1EMKIyw5jng+craWPbl1YzSjMo6baxR2mqtCr6fDlHrdcC/zzMPS8E4wF5c4LztBMOthMu84knqLc4m6Em3bxK3UJm5kxox9PUFv7vvoVenaBwK+QoLGwRVlCDIpQQFIjCu+kWceGGHTmSsVlSP+lEeM1yxnKovEqu7m0zpsaaNLOT1fOzTz1ribNehwrXhYa/C6f6uevuJ79pfjRK20KFQFPS115KlJQbQMNCTUOsoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB8088.namprd04.prod.outlook.com (2603:10b6:8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Fri, 10 Sep 2021 08:35:43 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 08:35:43 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH RFC] Specifying default-disabled devices
Thread-Topic: [PATCH RFC] Specifying default-disabled devices
Thread-Index: AQHXph7XaDoDuCtzckiEaWGJvZNHDA==
Date: Fri, 10 Sep 2021 08:35:43 +0000
Message-ID: <20210910083542.GH17315@packtop>
References: <20210910022433.GD17315@packtop>
 <71375410db4f03bd19c820f97f3a23418b56ecc0.camel@codeconstruct.com.au>
 <20210910034958.GE17315@packtop>
 <1df72fd584f9c54544f9d5fafcd6232e3079ee49.camel@codeconstruct.com.au>
 <20210910052835.GF17315@packtop>
 <857e71679c7d1a421f6cc50896ac7927fe49cd74.camel@codeconstruct.com.au>
In-Reply-To: <857e71679c7d1a421f6cc50896ac7927fe49cd74.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeconstruct.com.au; dkim=none (message not signed)
 header.d=none;codeconstruct.com.au; dmarc=none action=none
 header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1301600-a740-411a-431c-08d97435fa6f
x-ms-traffictypediagnostic: DM8PR04MB8088:
x-microsoft-antispam-prvs: <DM8PR04MB8088967BFBE49ABC29E55D21C3D69@DM8PR04MB8088.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kWOu9rOYCK4HRYxLFYTty3R6Pn5NVHWkkbsvu8RTluoT2sJ+rzvB2tKEa+XPHUWBfRI2LOXqjoPVIHMt4MLhU4prQymDBsmmWGXyw8v2VkXnwD6THcrlgDEkJ3mFGxL5m+5GcFKUfQapX6NJuYyFhjIYZMaaWMGsdpKBK3oG0JGix7T8q20A6IxFaIcW4ZTFJF7wmABzQDnBylaIiA7V1ggt18UEqEnlFMJTi/eM/9LJyjqtep3z6+OB6Yf4Eyq1cLHqqgREh1+M/ff+u7UKjBaVxV8zJx2JMoNQOCNFCL/XFPa2cLkEiyt+3ui52dzOs0NLb2LMWhPywjNjMOyWbIP0/jx8B7eFRAv9wpfRvb5D8Dmqa0nopYYhWpXU5hX/cW2HZyEe7Iwuest09mCj4eSHBbw9cqtsCaaxBDXto373YeZtKCCdiR0cILJFCWa4xnnIkRDnz86UG8+tphi5lWiBAhiAwu8b4/xVSzsoR++bxpHK1AXyWE3DwzlpIaEcgvTFhVCllGOnrHnTzz8SW8bnDExgWjhdvT4JLKTigebqrfxfr35aICn694XzjC9Ic3DqY9dumgjgzTZnX7uR2NHkWff82ZkHMvVgvD5K9JhgBkIROIL9x+6eVObouu1YbBZuMAZ3wKVu4Za7ByzK3Y3gulNfysiTB2S38lcJuxKZktfNRiscwLoLYjOaBXr+1Kb4j0tBiSa76xrw0YZikQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(4326008)(8936002)(8676002)(54906003)(26005)(186003)(76116006)(71200400001)(66446008)(1076003)(6506007)(64756008)(66556008)(66476007)(6916009)(91956017)(66946007)(122000001)(33716001)(33656002)(2906002)(6486002)(9686003)(86362001)(83380400001)(38100700002)(6512007)(5660300002)(316002)(478600001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?X71l5tJ1vyk7kHT/3xnelpqxKWA9DtZSvAMDTkHdT3rpmzOyyzAYSMyPn3?=
 =?iso-8859-1?Q?Xmds9cEnRAnE0c6FUZc/IDG0ZlUE7ZPArS3yPstyilEHrWVzUYdwTDWE+l?=
 =?iso-8859-1?Q?9jKmrGb9o26t0+sjsyANGR7vFTzR6bQ5s9n3Km61zzqm8qmt8xKtaLSrEl?=
 =?iso-8859-1?Q?BbYN/iRdb9eQwDTZdWuWU5zp0c3E3v+zx+jOPkW0ujdUmIFpZqSkEqDy7Z?=
 =?iso-8859-1?Q?mdbbA5n+3P5Ywwuc4WwH1dP6M0ppFOtTnTY2xGmEfM+6kTAGKYhga244F9?=
 =?iso-8859-1?Q?YK/Zu0toCFUMWOii2KYc805x84xkYhouQP49K67IEp7vCjVyIO1ApXwPJ+?=
 =?iso-8859-1?Q?xE82r3LwsICVDPsjKzR+sFyILsvzwsCKUrKSQLdvPZ8hgR80nBEdhKDGSq?=
 =?iso-8859-1?Q?0Wk+tIqw+cRLdghnz9+BvKVf+Fvfi6USM9zSd05pOixYa59aRXiP3IUuzz?=
 =?iso-8859-1?Q?rNicqoGm+A7Ce5Pdh8Hx/ExhFLb1jAoXfZCGVkb4Qmi9tFDCi3K734ua3G?=
 =?iso-8859-1?Q?EID9R7S4jBJfb8KQRyMFT75/tOEVEO+n3+J3+HaaWMSm4cEiLLKTO6vpxM?=
 =?iso-8859-1?Q?cWZAB/DSkBl2fRkht/yW/OOG7fRdGlKT2GomHRYF5Jv5TVPjgtqj602Nnx?=
 =?iso-8859-1?Q?eeah5BemRaVLptoJggjBE8vieMjvRQMMzUwKfkkV8/hn75ZdNFDKqUW/Yi?=
 =?iso-8859-1?Q?UDhmEo0hfWf3nLGA845JhcHqWmYs6KVkimBIFmWj9hHJHxH7sgI6OqtYrz?=
 =?iso-8859-1?Q?+AIkUpB8Pfyx0PBKLq3TSNmpGPcBQ4wJ4wSMPQm2khLWWaKBzqGE/VO0E1?=
 =?iso-8859-1?Q?JFW8UvjuT5GWMywupdM4VUfaf3BHknxprfWBCcSsW9vtZDEjYcohW+l7gt?=
 =?iso-8859-1?Q?DwPdxskSvG2UCGf5/kx1RrnuZF+QVzJnLxnLVgUB0fSp0hNmCOvBq/HPWM?=
 =?iso-8859-1?Q?I1qoeGkpnDdSSmrn3zIcvstdHuS5VqQ2RijMmBQkuBMhd1d1pXQ5OyjREq?=
 =?iso-8859-1?Q?+pL1w6xhl4yFPqvC8d+OJDE8YZidWCnG11OYNdCMm+bDCuJ8pHjyhCgPVw?=
 =?iso-8859-1?Q?mc3PGaEDIp2kOLgFA5OZEvj1TRneN2nA4fUCviReUaKQMpavByWGJmAuwb?=
 =?iso-8859-1?Q?YK9XumxfK5uU3xIADApV0MMS9XcA8e5meFWk4wmnmERRTsFyMQQyPDSOuO?=
 =?iso-8859-1?Q?VtdVUM0+wET2e+AS/0BGYmwPsqk1RFnfhedDkb0Yw95tQeLjmQ7zSoOg8m?=
 =?iso-8859-1?Q?upl7Nl5zLs2Sv0ODRpMyO6q28MVzYzNwmenguEySPvM+joyCxd1FN9wR7q?=
 =?iso-8859-1?Q?yIoDVymiEmwPsqjjVbgSqLoBLjFS0b7f4vbY2xwRrKvIETYtrT58V3+cDz?=
 =?iso-8859-1?Q?EIGVAdgO1sICKK7vohXjfmLy0c0HkZpw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D9B322D07F769D478956DF1D71FB1537@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1301600-a740-411a-431c-08d97435fa6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 08:35:43.2225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vn1AsX20TBnBoFeOepU3/G+U7jObolHCMnlva4o0pM8hxglLFPaGZ6hgvNPYKlZ9I4hPH0/OEfkc40w9e6eSAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8088
X-Proofpoint-ORIG-GUID: XOPxfcTYtWVCBvmjLVyT88DqMMMqpGQA
X-Proofpoint-GUID: XOPxfcTYtWVCBvmjLVyT88DqMMMqpGQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_02,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100054
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 10, 2021 at 12:59:10AM PDT, Jeremy Kerr wrote:
>Hi Zev,
>
>> From some grepping around it looks like the only check is for
>> "okay"/"ok", and nothing actually checks for "disabled", so I'd think
>> any non-OK string (including "reserved") would end up being
>> equivalent
>> to "disabled", and hence result in the device node not being
>> instantiated at all.=A0 (A quick test appears to confirm; with status =
=3D
>> "reserved", an attempt to bind via sysfs fails with ENODEV.)
>
>Ah, so you still want the device created, but not bound?
>

That's what I'm hoping to achieve, yeah -- a device that'll be left
detached on boot, and only have a driver bound to it when userspace
explicitly requests it via a sysfs 'bind' write (e.g. in my particular
case, only when performing a BIOS update).

>That might not work for status =3D "reserved" then, and I'm not sure we
>want to change the semantics for that.
>

Sorry, which semantics exactly do you mean we might not want to change?
It sounded like Oliver thought that interpretation of "reserved" should
be viable, modulo some possible bus-specific caveats...

>Just so I'm following along correctly: you still need this described in
>the DT (rather than instantiating entirely from userspace), because you
>need additional platform data for the new device, is that correct?
>

Well, I'm aiming to be able to use a dts fragment looking something
like (on an ast2500):

  &spi1 {
  	status =3D "reserved";
   	pinctrl-names =3D "default";
  	pinctrl-0 =3D <&pinctrl_spi1_default>;
  	flash@0 {
  		status =3D "okay";
  		label =3D "bios";
  		m25p,fast-read;
  	};
  };

...but I'm wondering about your mention of "rather than instantiating
entirely from userspace" -- is there some mechanism for
runtime-materializing a device ex nihilo that I've remained
(embarrassingly) unaware of?


Zev
