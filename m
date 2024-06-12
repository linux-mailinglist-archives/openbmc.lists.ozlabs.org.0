Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 707A39048F8
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2024 04:25:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=Lb7Qi2LV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzTss2hr4z3ddX
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2024 12:25:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:2011::700; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzTrl4NRHz3bnt;
	Wed, 12 Jun 2024 12:24:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQ2dqEXBAaQNQmTIy1TAVaw1r2ibo5Sm82GXkunKNk7fefKN1gguIfxa/4kHPpUT2jteHYf9BFNX4rGP+PTB6riUzWtCK9JOrgKrU93aA1sQFJ14UXKCN4+TWR7cESTIWusRidpfuhuO4ibTNb6B/4EykEJLA1N7yOkT2RA7Lodny2wt/BfEnkQWwrsEiEe4ugWdYuJi8vIsOyUSUADPOa8ZlazVROjn1W1uctfINg+U7Bpsg0FREli9GM+WxUyf10Zk1Snsf2lkLeZ+g3DW0fHEfykDWDObtQ+01ISeLdBa1n9rU8bNzQzkOj+WAFb0R/HfCoKWW5s4ERTO9GZYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSZpW1B8tsWsXdUkfA/zU7TYeIsAtmYUMEh/STEoCuY=;
 b=MyY6JQ44QDBoCQndfcUMqHX9u1pTKmCzbLtJhY4MqjII1Y2wcjt4u/CLsBnIP0MaPhgZ6pjcHnq+RfOn2M7qWFx8FZL0cSe5lfe8nJPdTFEFCgODQ4marUo+9fWG1GUqF/CvkZKnpTbo57qcLYUIrOCpQXkhwLvKyfPSaXO8elcTVphTvip/3G1xd0p8WXaTaMbGntHdYO2uO9CRBfHPoDIMzPIxCS/mtk+9gQrWXbZAZN8d/+ThaCEH+i1hD/VHYBpsuUbCVfZdQJVe9z9RP2hLHc6rsAqtPGgUUquOLIhA8fVWBrsDKYQzqKrQfoGd1IKW1gOpGN0ZU6C4UXH4mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSZpW1B8tsWsXdUkfA/zU7TYeIsAtmYUMEh/STEoCuY=;
 b=Lb7Qi2LVfM6YhDdkck6myth3V7cu91Yo5BX/bgeQCtdM5Dql88h5MULJU+XnSpZ0XmMMXBjPUbvy+FsH37ARUcBmctYPSRbpLhuxjN10pFb1W4xtuXhWk3H6FF7OMRU4zmtgJloQYbM1YoeFBd/ONluXU/3P+gVAkG0dMw65ihjmbPdF82BXiN4TKbE8U3fgDSIxtoGnGSrL0YFTjs+Q68aOtkGX5/Gvlg1NCfaKNn1WCYxJ/Zf35mwNRiRH9plp9SbziLVqcmccs1jBL9NAzwnQfbau40H8iVUfHlFdYrKdP9N7byKyHlpNiC2wpr0B5PMliK8KUdJLHniFYQdjng==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by JH0PR06MB7180.apcprd06.prod.outlook.com (2603:1096:990:98::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 02:23:59 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%4]) with mapi id 15.20.7633.021; Wed, 12 Jun 2024
 02:23:59 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "Winiarska, Iwona"
	<iwona.winiarska@intel.com>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] peci: aspeed: Clear clock_divider value before setting it
Thread-Topic: [PATCH] peci: aspeed: Clear clock_divider value before setting
 it
Thread-Index: AQHakM4L//12gtiKPUW945Iv0Rt4T7FtIAOAgADqhICAAKNdgIBVDrrp
Date: Wed, 12 Jun 2024 02:23:59 +0000
Message-ID:  <OSQPR06MB725292ECF1EA0849C9FED1E48BC02@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240417134849.5793-1-iwona.winiarska@intel.com>
	 <7b0ef5c90138e8c1d1829de249a480709170141b.camel@codeconstruct.com.au>
	 <7520ac6ef7afae66f9b1636e5806ff2bfd93584d.camel@intel.com>
 <1583360debaee14a988e4019cf30250f6eb4d8da.camel@codeconstruct.com.au>
In-Reply-To:  <1583360debaee14a988e4019cf30250f6eb4d8da.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|JH0PR06MB7180:EE_
x-ms-office365-filtering-correlation-id: d207d272-95e7-425d-4aab-08dc8a86b7a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info:  =?iso-8859-1?Q?eOEO6EpedtWbcZS5z/EJ2ObItR/JSoWi9xFC2mEjd/aYBOa00Xx4DGKEt8?=
 =?iso-8859-1?Q?/KLhHWTKX6wRiP0AIMHP3FK03IDUvJmKYtENaMCenqDeHLIjENSTID532Y?=
 =?iso-8859-1?Q?rnHHqZMmyrMtJzmf3UtMc4xCK5lIl4VqK478TFN7CCUkVG27y0F9t3F4I/?=
 =?iso-8859-1?Q?M77+cbs/uopMfaf2vntn04LO0aq/2pMJ+LENVOFpF8s4LySlXiFK2Vrwbq?=
 =?iso-8859-1?Q?MS8CQmkeknfMKxtlFNUszQ2r8Z2XkXb9lJTZqaGmsH+jxtfEqgCZsgbuP6?=
 =?iso-8859-1?Q?1SBx7ApsiRb93zHJrqqeQGd2aAxlkefFSyV0C9YmRV56ZPVUQf8HyfGeme?=
 =?iso-8859-1?Q?dH5NLpVxhYiNlmO5ORj9nHhLWKnNXz3nW0eRpflA7RqkTBPbBbGvCjQDP5?=
 =?iso-8859-1?Q?NVM+TROGpcmiwyJDHO/yAucOfNmenzty/QU2vv38aPE37CLZEU/SAyo8w5?=
 =?iso-8859-1?Q?PbGmH0hcVJS0gRotMslYJhp5tkzESAbsNpyhwRc2yOWlPNfNQ/WfTxA7iX?=
 =?iso-8859-1?Q?9NB41AqY96nbTOkZ5AIVJDpX3eaEi9R2bHvIDfy15n7J+zLI8ntqc3Ijoq?=
 =?iso-8859-1?Q?MbM0Kd2I6uEtX8rMsf+1sF0ujt5h1cDsaWOjAfqFnQnRW2JFPGf1b6s/cw?=
 =?iso-8859-1?Q?zDtBTn6r6FzZyz8JMN34SgfaXwDcAcsuNgE7JnHq7mU1txSTBmM7VsJynI?=
 =?iso-8859-1?Q?P2jxAx4kgfVHI2TziK/B20oinmUgrlK48f9AhxfhGlnZfj95wfXEG6t9TP?=
 =?iso-8859-1?Q?WKOUyivu5lz8LZL9xEOecLeD4t3TtQwWfD143ddzbC/W0C2Cz8BJpwqCZz?=
 =?iso-8859-1?Q?WNaEyLsWE9WWdPc8csK3Wsd2X1f/PAZW9RsE7IEwXy8QIjYJbh8OdkLhb+?=
 =?iso-8859-1?Q?xXid1YPNNWjSkHNk+cTEjma59QbgDYpOXuv0zesv1Rzr59waYrw/hsNHhz?=
 =?iso-8859-1?Q?RircUlAmBZu/kq7vXUI/7w2DKGOPxEmdRnG+0Dwha07PDTszSuxFPPalN3?=
 =?iso-8859-1?Q?EHkccyLvfq6H+99ydajKzKJyCDuko+koxlJEej7FuDFeYUBtqoGya62D0A?=
 =?iso-8859-1?Q?7WfkfaxgMToyJtN9NuEmrIDheqW4ql+mBZUs6wmlGenlhvdr8QuP754u2M?=
 =?iso-8859-1?Q?c3TRU67F21qAAEQgZN1Zaz/OAXZGoQo7PIO54w/2onI6MVEx95Xdr4fC1u?=
 =?iso-8859-1?Q?B05MB8Y7B7RGIjWnN7kWhvBAn0ayTHsL49ICODYwrsz42q9KpR2aySAgru?=
 =?iso-8859-1?Q?wY4lkLeJFVLJ4tmAIVPFXEp5Fq4ULJS5xPqByVR8fBnS287wii8Hj+a1Gb?=
 =?iso-8859-1?Q?jJRiMZaSRZHWG4TREeoRhIz39uJsfTeff285nysA0KstWMjGgPRoohCjb3?=
 =?iso-8859-1?Q?d5cPcX3V/Is0iNYT4Lk+Y5d3myVfEHNBkjhoNHAqh99GpO2vxR3JI=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?YgEil8CGREQR2dNh9pmwnNmastM3zWRjrln+UB+y0s9dV+E0B4dFDZ7vjP?=
 =?iso-8859-1?Q?PPCWVdnHzJ8oKTq77WCmBaigRke+exmjoqcX+vFjsEdWxQIog1Van/1p9r?=
 =?iso-8859-1?Q?CVFG03Hkovcg1Yfpk4sy5T37tDiBvoXpLHICpDjBLi3LmS/MkIvNR+Fmzp?=
 =?iso-8859-1?Q?15bTgtX4+XICBFj0ICawzyskdgeOwp7ksIUhFZKlYLeuN/19CUMkqFCsp7?=
 =?iso-8859-1?Q?NwI8yyS856a3jE/oDsBrZJ1PfZ81BZieBmDSZjKkasfWH2KYitqaHiGfms?=
 =?iso-8859-1?Q?4e2//h1k8Q0YeLonmP6pMlKZ7azD9NOlMRYojnlFSbqgjvwucUGtoQ6dq+?=
 =?iso-8859-1?Q?swlAu05limPeL3q+tQAuaMta369gCmeu0e1iJ/zYJT3aDgINHOs+Klx7hK?=
 =?iso-8859-1?Q?oNsGsNVuoB17eIZwGC9kiAm5l/AqBSIsUDKqJa9vzW8SBxqurH+s22j+UH?=
 =?iso-8859-1?Q?Lu6j3d4X7VRJf/XHEmLpRfN/Ov22DOSxJDNEGFESY52Ec7Sa4T0UcelKx2?=
 =?iso-8859-1?Q?rYUgSGu7iF6wygMrHo+NoFgkZUB9C7gqjOwlBYuGoYwue4GmN/vlMc4uxz?=
 =?iso-8859-1?Q?FryeN8gHLXXIYVnT8TcKuNZu6v4vdltB9LgI6zIoF3QhAQls1zlfSc6zIQ?=
 =?iso-8859-1?Q?hKoLyxoYbJ9/V9DtM3kkYI1ygISUxtKzFnEE1/fETTrH1HZJDbsZkX5ndf?=
 =?iso-8859-1?Q?wMUFUUdTSrLsZTFs/TVZd11PFS5t3/0t8+jZ3gNSqihjHDW8HFkr3G4d1R?=
 =?iso-8859-1?Q?WbSJBsLDCq6anUKBkiR9wSzDSBFXAoc3iKiXd9Xrn7A2IkqA5gnjIbUhV3?=
 =?iso-8859-1?Q?2RhGXm2VAwpadKmAOnnq//UCMxlyq3K8AataG2dFmFvIzoBJzKGHUNAsY5?=
 =?iso-8859-1?Q?t9V6ZTGDxXEwunhy3qTDGWgbG+pvm7bC3QZepimEgmoqtnM0qcucS+lODu?=
 =?iso-8859-1?Q?AhWAmpUa4RPcCpDioXXBhBrFPWLHRVWMjr22iNTD6pAsAJjEAVaXFPMtu2?=
 =?iso-8859-1?Q?tRKy2VgjwWISkSUnK5qQJefpmSfFen2pWh44SJbaNP6aazbC1fH9he6I+i?=
 =?iso-8859-1?Q?gkCveLzSalK/hT/Qt9pI2irlTkfJKEtMOXNaJr0Z5u3ZT8itbsfHjhfltN?=
 =?iso-8859-1?Q?Lauqtk8nHa2FMXQMcTNEcXEOE1hjqx+J/dKNu6zWxmayPN0rG/GuWOvymS?=
 =?iso-8859-1?Q?gm+vIAAHZiodp2I1BemIwpPOE/Lnm1jfmWkCfyVX1g2HV/TBCE5s7oHi1h?=
 =?iso-8859-1?Q?AS/j4SyLu+RqtkLaDKvDjpB5KPvZOZQlNDLC12mBOKrxjvIH11GC5okUeJ?=
 =?iso-8859-1?Q?6L2Icbagg3BiihIUU94nvYa5gn839N/RaWC67HxMV54XJ/k1qc+/Qbt8bJ?=
 =?iso-8859-1?Q?7/Rsgm2B6ed+M/CuvCrWCX0mibKylNiIp8ZFQgujVDWHE1XPNZtDi2dY8V?=
 =?iso-8859-1?Q?L9PFCJTPQSESdRaERTFRtbll9UKWNyPuiKNEfkREadbn9teT7K3PomUaC5?=
 =?iso-8859-1?Q?r+vX/5RXmgSfdRFjqsup5IaMlrDflRyjDyQe1EwTOH4/a6aLgxJMxsukFJ?=
 =?iso-8859-1?Q?esRBALT3QwgjGTiUxo5n0iNtnPY8/lWFaMOm6R2gOkYvuXcvz25MjUZESo?=
 =?iso-8859-1?Q?5lf/ockg1XbDQ5CwTcxEBc7xFOAwJXTNsN?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d207d272-95e7-425d-4aab-08dc8a86b7a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 02:23:59.0883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LzUqivfz0a3/a2bxN6iB0Di0QlKOEQJVpoi8D4VHgCUyOGQmm+xwo/TckriKsrtDSyn5k648319JVhAdqQzAOgsRGodr12nRL0LCydUHaDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7180
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

> On Thu, 2024-04-18 at 13:41 +0000, Winiarska, Iwona wrote:=0A=
> > On Thu, 2024-04-18 at 09:11 +0930, Andrew Jeffery wrote:=0A=
> > > Hi Iwona,=0A=
> > >=0A=
> > > On Wed, 2024-04-17 at 15:48 +0200, Iwona Winiarska wrote:=0A=
> > > > PECI clock divider is programmed on 10:8 bits of PECI Control regis=
ter.=0A=
> > > > Before setting a new value, clear bits read from hardware.=0A=
> > > >=0A=
> > > > Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>=0A=
> > >=0A=
> > > I think it would be best to add a Fixes: tag and Cc: stable in=0A=
> > > accordance with the stable tree rules. Are you happy to do so?=0A=
> >=0A=
> > Hi!=0A=
> >=0A=
> > Technically, the initial value of this register should be 0, but I've a=
dded the=0A=
> > clear just to be on the safe side and to not have to rely on that.=0A=
=0A=
> Yeah, it could cause havoc with an unbind/bind sequence if people are=0A=
> messing with the clocks in between.=0A=
=0A=
> > I don't think we're ever programming invalid values in the real-world s=
cenarios,=0A=
> > and because of that - I don't think this is stable material.=0A=
=0A=
> Right, I don't expect people are doing the above in environments where=0A=
> stability is a concern.=0A=
=0A=
Reviewed-by: Billy Tsai <billy_tsai@aspeedtech.com>=0A=
=0A=
Billy=
