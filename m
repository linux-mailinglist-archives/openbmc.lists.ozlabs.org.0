Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D14CE902DC0
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2024 02:50:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=mTkir/+Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vyqq05JCnz30Sx
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2024 10:50:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=mTkir/+Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:2011::701; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VyqpR46c5z30Sq
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2024 10:50:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjZe20hLpXg9zBIgiejhxm6p2bCuJKptckZ0ZXHrOL7a8rN7zAl28eaM6CRjGYuH5ydoR2Jjcf1CQlkus0CI2SlF98HzaCaMchinoEVPb9SqqyptjgU0yUPN7gT8ZpINCBir+ocn/ObYHnBK5UlapbbuGhjI2WmmQVGh+ZRWP8anv2Vlb2Unl4tFa8Gn/rMnLxdPCk/A7vekEHHK+qsWeoeunP6aJI32X/kDLdv7KsOkdR3M/mr3qQK/eA1YuOlVXLpimMjgPe+zcryg5qu0w6LFk+4XQWLjKi1FOOp50e8C3aFlPSjCM0+pAXdTd6+qeIZuVHy6nEbwGJwEHzSEpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65tq8HCRxnWnu8/ZbAKN1V1DC4hzc4Hz02V3fipdovI=;
 b=XnfC1KZBzCjzQKtAX18MfRv65fBKqx+VuOgodTkx4H4P/99/1dlghrchD1b0rp+koPM2UAI2rIurE2YyzqKGKZDRJHRSg0AAU8Doi8++3tqEM4RAnc84u6sYhPYL5wmYAo2UVrYI4GMnLN0V0wPlF36qC4uevzCaMdon9fFqVmRfjrzBIuI6AhdZomZinDyjKBPooMgJRgN7sJIGOUJVYBR+6SmWGOTj/2mQ54kXV48Wk9EWckkNYiPy1+M/0Wrg/CRrtWQcpb2Y3RuvyJxKpn420vkIuWPwn1coMWRd/0lHdoGrA7MVWBncZZf+0JmdbMLr8rP5fS8SvLN27JxoSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65tq8HCRxnWnu8/ZbAKN1V1DC4hzc4Hz02V3fipdovI=;
 b=mTkir/+Qb4f87E6REDK9pOJkHXm3weTQ3kMYXc1YMOFwSKet+bCivZlFDaCPcOgG1fBe1WIfhip15EwV8bgPJoFVhQSZsyCDXdBcEZR8tJlB1p8MBRcD88UxjZF63LnS554XHmpFw6M5xBL3uxFQYMMO6OT2T9eZpkyiHPFPO9BvK5LATI3++NB/Yk6t/C092kLehai2M28Qckt8DzAdurBVdeKiNiwUhsH4Z7bpXu/H9WYSJV6EYHeG7XNFqnSOO39rW3V5oUiHsTPNjNouiPxxH48Qp6tj2+vKEHTR3+LyH77oAZgpcEnVwkURp+aWCLxfbW95+VcuUKl+AZo5XQ==
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com (2603:1096:400:33d::12)
 by SEYPR06MB6635.apcprd06.prod.outlook.com (2603:1096:101:177::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Tue, 11 Jun
 2024 00:33:50 +0000
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::cc07:35e3:9143:c8e2]) by TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::cc07:35e3:9143:c8e2%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 00:33:50 +0000
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: RE: [PATCH] i2c: aspeed: Update the stop sw state when the bus
 recovry occurs
Thread-Topic: [PATCH] i2c: aspeed: Update the stop sw state when the bus
 recovry occurs
Thread-Index: AQHasl/7kNWQnBw5T0ayJZ/33ciwnbG5/HuAgANZ04CABHIQ4A==
Date: Tue, 11 Jun 2024 00:33:50 +0000
Message-ID:  <TYZPR06MB61918DCE07E61B6FB9D3BCD1E1C72@TYZPR06MB6191.apcprd06.prod.outlook.com>
References: <20240530070656.3841066-1-tommy_huang@aspeedtech.com>
 <kts7ib2rxq4g26ayumcyaohs37zl43qo66gok3vae3reyabobe@nbbborkf2eow>
 <TYZPR06MB6191C0769400FF03412E56F2E1C42@TYZPR06MB6191.apcprd06.prod.outlook.com>
In-Reply-To:  <TYZPR06MB6191C0769400FF03412E56F2E1C42@TYZPR06MB6191.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6191:EE_|SEYPR06MB6635:EE_
x-ms-office365-filtering-correlation-id: eba0cc6d-9940-4193-0b3c-08dc89ae2a44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|376005|366007|1800799015|7416005|38070700009;
x-microsoft-antispam-message-info:  =?us-ascii?Q?y3anJAzoWdiBB3OILlvy77kjKLVLcYTUOlUoJk6jYudFS/xV8GyBDWJN8eA9?=
 =?us-ascii?Q?M9/lxHkZ78SDCAm3Lt1FyKW7e/iC4bt7xoe5uy6ho0RF1xehVTeYUScgewmf?=
 =?us-ascii?Q?uQvyXpycYCy0eY2AlWRrj4oS4oBOSClbME1cmU/PK9nhP7RiXG36RXnfy0yv?=
 =?us-ascii?Q?Lt1vS7pPtZ+mau2FkQqVui/zVLz3ByIUDpmXmWp9JLoVkPyNSwK+fmslXrtz?=
 =?us-ascii?Q?9N++/9Y+V1DEz93A7yZaY3kc+v1hJRKXviKPZbblQyApdcNjUQiCZRreJC74?=
 =?us-ascii?Q?kmjV2UQB8aelHfHJCZwZlq2GmUYPA66gw9HkxwelZomsYfGtOPqT0AHq89FX?=
 =?us-ascii?Q?PI4s5vv1j3Wtf9sKaIRbjVkDBk69Mssb1B8oHjmCLFs22NyuJDNMQZi21W06?=
 =?us-ascii?Q?ZJ7ZaRj4YWO5mhuNyuzXgsQn4nPk+/yCLMHjpG5yVazsHTJOw06Zzdv6+igv?=
 =?us-ascii?Q?JycEXkkJ8PbYEusxhel6QwjPYbJTBdCJYB/SbJYlZs6EAT2en/ltoNqwY3RT?=
 =?us-ascii?Q?fxe6gl6eKKcZI5i/bIU2wveclaa8sAa4ybYL9rJ5B5xJHzziJkN7nxfaeRaC?=
 =?us-ascii?Q?WpMgN8iYnX0/iNJt10CPg0QYBVxA/RPiAE1CVUGTMYqtof9mKECDX/rjesjg?=
 =?us-ascii?Q?RRDozjbkOjqB23f0F8JZsJ1gWL+z/H5mGFToeFDzNmj0ffMBb/RRhYOFB0Xz?=
 =?us-ascii?Q?DqfNVoVes7kx+GAKcIc2wgJr9FuBwfRmPGx4fQAuSfe+nUkhu40k3x/3ShGK?=
 =?us-ascii?Q?C37/5GBYhCPanA1gNGRBdAiwK3a+oSpc624AsP76BfrYiB2suTXZxDTGgR0k?=
 =?us-ascii?Q?EPQVydQhX/2dzLhoNoazcr0zZdmZ9o8kEDKq/qMntWwCF4loAzNOKxkzzoT6?=
 =?us-ascii?Q?ArBbn8dDWovFRAay+BQtOLRsDHwa6m8xw83kySlDbO8HK3nzvLnll225Rxbi?=
 =?us-ascii?Q?uRi2VzGUkk1KJn0pgOuxfH4uBkjhdt1+IicAI9NlfMAKlmF/2KFHSkYOl5a1?=
 =?us-ascii?Q?336ifcqhZjR0Jcxi6CppPjeUjr4c0AOOlXy/GNiKl+yxj4E1evrTArhcr8XU?=
 =?us-ascii?Q?jFzBfAJ/tpchQDsvJ3imdCjkKIkxgbuUu3vxBbpauO5gJCyf5WI5nAnaZVR9?=
 =?us-ascii?Q?VtRjrk7o07b30gZi2qoxCKmG7lbS743JudwYaN6/A9FhST5nxZeYMhczsRky?=
 =?us-ascii?Q?LOu56LAgMykQ6aw9ham0i5XVEBce2ykkFT61Z/v5Hu0iaMQtWth5pMiyjhuS?=
 =?us-ascii?Q?VAVngoRLuAygBP4rxC2CDf2un6QV94qjlg7yvVgcTcxmj9Mu5lBj5zN1Kxjg?=
 =?us-ascii?Q?gyCvaieRMnFGAkU8AtsFQq/IyayIp1edyOElyQ8ezadQZCMruaCL8b9zGwes?=
 =?us-ascii?Q?1SRTg4o=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6191.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?XJcmNePDsP/Ki2SSoguvQKitkUo10mR3AHkRFUrOvuxjld/y27bhpT+NzjFa?=
 =?us-ascii?Q?+JGXiTDzq528se1aBJ1yYUsz1rkd8P57s5GLoXH0PTotY+dm4z9LJnGYGeyI?=
 =?us-ascii?Q?x6+Rd+uyCdVDbmlm9uqhhA810mKaL+laTPCk+b04kTLBZMvwvhy8jQSyR/s+?=
 =?us-ascii?Q?QY3cYeO18LAIu7Ocnnoh7v2Bam/cZpFkSfakZ7BlRG2Bn9jEeyD2ZFHKbFA6?=
 =?us-ascii?Q?qJ8/oiKnXC4DNHz8BP6MaNPjXMNAU73c0MxYwFrvNu5t0BhrF5V6CEVjO/2b?=
 =?us-ascii?Q?P8fVihfGpkWYgSjn+s+H2Yz52oHXcQZLX78Ca1MwLl7qaTVE4SP0GWfWbUig?=
 =?us-ascii?Q?d82bOHvUae4S0WvIGcoUxT8QBpA7as4vtv33z6f2bBQoL+tYyOe9srBJ6Wx6?=
 =?us-ascii?Q?5hXkWAjQEVTw55FADVOKPFRbe5qXv+g6sYNQYfLE1b0S7UkF+slssqOHhnyq?=
 =?us-ascii?Q?LtRHh8QFCq5ZzItbdhmPz47O4d4E2hnmfDSWjLdBld2Hb7oYOEAnSM1dJBa6?=
 =?us-ascii?Q?2S1dSbfG91jZAVgLMDJm4RneXUMrb2cYhT7cf9ORxjXqaSz3e9gQHP3boq/I?=
 =?us-ascii?Q?gvn7bjVRfD6kEkjTDoVbILUrlJjj41vWP/ue4sw4G8aaONrdjL1Ow3fOKCqE?=
 =?us-ascii?Q?PnD7a4jCV41xIkg6/FtMkfR0f5yuGJN2YMUFnB2eBE/um1oyhp9EGQJXDbjm?=
 =?us-ascii?Q?Vb5kGOtRg/h26DbzpycZjUeVBcvcwWcrQk1OBzxpi4rH+lWXZp1st1sz4HTm?=
 =?us-ascii?Q?lB5HEzyVIGBRSJ7hKbiNSB/bO/XnYMeC5d5Viw4hRgeSwkKaTe+xsn5iuBY2?=
 =?us-ascii?Q?v6JH9mPEU3nbv062VbxCZQlwzDF6x3uqzuA2UnHl38ZKuxJQEc4ls6C+JMtW?=
 =?us-ascii?Q?YkapThWgF1G3vL0OWH9RiN+7zMLsOqF3iVvGNT4j3yPN0efPd4lMGdA7Ell4?=
 =?us-ascii?Q?5i9aa15tLPMKke0k7iIfam0OJisOT+sGdA5QVr8c20uP/kEoYXIN/RDohN3y?=
 =?us-ascii?Q?ijrqj10K/aTjkntC4U1SevkR+hlEzXRrCpmhRn0v0ArWV71Gd79uz6WrrF2o?=
 =?us-ascii?Q?H8GsiJ3ggWwwj0w6I0iXCoL9JNJV169HrnUi8dnS6fPxH1qXTgEGaQgmN9Ow?=
 =?us-ascii?Q?YoOjgXvEoz07LIt5Rns6ljfpxxWqoocuHzMWBYIpZW7USJBozLGV+MnWsMRb?=
 =?us-ascii?Q?kbS0uVzvMqRWyGvp0sQmMrBa7qdkE9tbUkUFqDyro17cSLXbI+h1xJpQkv38?=
 =?us-ascii?Q?zeivrLBxscnZni2OTOXl3QbmnOCJ0+hMEegIR6CEFIBQWbrjmjWoyAHbpHMH?=
 =?us-ascii?Q?EweihtOr+RxsHhcu8Enp+AltO16L3vgokYjjoY4Ntlv59z0fjVgfSWK/xnQF?=
 =?us-ascii?Q?xt6zz5/hA9Fy7px5WdPysiAPpnT+NQ5ovug38iww1u16x7pdcX5xJhRTL+c0?=
 =?us-ascii?Q?kd6lUHYfo8i2oZSugWG1zu7ICvgudUucGgHHhKkDmv9G+omam4KgZSFMSY6S?=
 =?us-ascii?Q?EmASPRpjkGQ4gLhp9owQuao57ZEJgtrnjfIPIk9qjUswdA2+A1kt6zQiit3e?=
 =?us-ascii?Q?mhe04AYI+h39Y2LYoFpsFshiK9PoKWx4+n89sJ5bPpKuCuP4NZgUNOPows1w?=
 =?us-ascii?Q?SQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6191.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba0cc6d-9940-4193-0b3c-08dc89ae2a44
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 00:33:50.6114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oj8X3aVMHSQV1/H8Mv26wtlqRzu8sQDwbaUw74v9cs/98wCBMg524Yzn+enAkVAdXjkykta3G0LjTAAa0EbZzcxXExyI3Yr91jLaaeBY8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6635
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wsa@kernel.org" <wsa@kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi,

	There is a problem to move aspeed_i2c_do_stop() on top.
	This function is like with aspeed_i2c_reset function needs the aspeed_i2c_=
bus structure definition.

	BR,

	By Tommy

> -----Original Message-----
> From: Tommy Huang <tommy_huang@aspeedtech.com>
> Sent: Saturday, June 8, 2024 12:38 PM
> To: Andi Shyti <andi.shyti@kernel.org>
> Cc: brendan.higgins@linux.dev; benh@kernel.crashing.org; joel@jms.id.au;
> andrew@codeconstruct.com.au; wsa@kernel.org; linux-i2c@vger.kernel.org;
> openbmc@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org; BMC-SW
> <BMC-SW@aspeedtech.com>
> Subject: RE: [PATCH] i2c: aspeed: Update the stop sw state when the bus
> recovry occurs
>=20
> Hi Andi,
>=20
> > -----Original Message-----
> > From: Andi Shyti <andi.shyti@kernel.org>
> > Sent: Thursday, June 6, 2024 9:27 AM
> > To: Tommy Huang <tommy_huang@aspeedtech.com>
> > Cc: brendan.higgins@linux.dev; benh@kernel.crashing.org;
> > joel@jms.id.au; andrew@codeconstruct.com.au; wsa@kernel.org;
> > linux-i2c@vger.kernel.org; openbmc@lists.ozlabs.org;
> > linux-arm-kernel@lists.infradead.org;
> > linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org; BMC-SW
> > <BMC-SW@aspeedtech.com>
> > Subject: Re: [PATCH] i2c: aspeed: Update the stop sw state when the
> > bus recovry occurs
> >
> > Hi Tommy,
> >
> > On Thu, May 30, 2024 at 03:06:56PM +0800, Tommy Huang wrote:
> > > When the i2c bus recovey occurs, driver will send i2c stop command
> > > in the scl low condition. In this case the sw state will still keep
> > > original situation. Under multi-master usage, i2c bus recovery will
> > > be called when i2c transfer timeout occurs. Update the stop command
> > > calling with aspeed_i2c_do_stop function to update master_state.
> > >
> > > Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")
> > >
> > > Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> >
> > Can you please add:
> >
> > Cc: <stable@vger.kernel.org> # v4.13+
>=20
> Got it. I will add it.
>=20
> >
> > > ---
> > >  drivers/i2c/busses/i2c-aspeed.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-aspeed.c
> > > b/drivers/i2c/busses/i2c-aspeed.c index ce8c4846b7fa..32f8b0c1c174
> > > 100644
> > > --- a/drivers/i2c/busses/i2c-aspeed.c
> > > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > > @@ -169,6 +169,7 @@ struct aspeed_i2c_bus {  };
> > >
> > >  static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
> > > +static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
> >
> > Can you please move aspeed_i2c_do_stop() on top? Doesn't make much
> > sense to add the prototype here as there is no dependencies.
>=20
> Sure. I will update it.
>=20
> >
> > It's different the case of aspeed_i2c_reset() because it needs
> aspeed_i2c_init().
> >
> > >  static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)  { @@
> > > -187,7 +188,7 @@ static int aspeed_i2c_recover_bus(struct
> > > aspeed_i2c_bus
> > *bus)
> > >  			command);
> > >
> > >  		reinit_completion(&bus->cmd_complete);
> > > -		writel(ASPEED_I2CD_M_STOP_CMD, bus->base +
> > ASPEED_I2C_CMD_REG);
> > > +		aspeed_i2c_do_stop(bus);
> >
> > The patch is good, though!
> >
>=20
> Thanks for your commects.
>=20
> > Thanks,
> > Andi
