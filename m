Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8351C435EFD
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 12:25:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZkCS0Z3vz2ynb
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 21:25:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=lTnOipwy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nuvoton.com (client-ip=40.107.130.83;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chma0@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=lTnOipwy; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300083.outbound.protection.outlook.com [40.107.130.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZkBy1WLCz2xTC
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 21:25:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbuuB3lvluRqbBo207zFlYTd7nvG8pNn8yvtEPWbJBZDgc/0BU+J9rrOB3RY2oU4xcldH2T2R0LEGiWG37t0aQV9kiPqG4rIf7Vi/K3z4Rb32SsaxnCdfCXxCYS/7fGFUdfyLWXIbL0hET67kny8WRG4lR3ke0fIoW5hwiSy1pYGsjM+yHpgzAQd1r0OC6XVVXdaO0La6hkWDRuY30PVzFZ51+nJNwJsx8QyiyXXINmCJZNUuP/R0Geho1dSlLokMNtZJk515oqajdvUbeAG7ndFUAltxAgPqowoPQmH6g99d6OWKZb79ARRYtTn04mOCy2lGV23bBbx3lZRwq+45Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQf2mLT8nEDomFx1vSksNDgE4P/y6dRHW/lHIpdjL2M=;
 b=QVH5le8iIlvRuQoRPlkDCIos4TyUfQotr7rQQmDAY7A4mW1PGcJ0osmpW/h0GwSQ2TIZTopsKPeiQCMymIwyZZjBBxCSmqXYFwIGhppYG3/RZ6/Qv33TaWq827hKlFravWbX03CPmUyf+KZFnIMlBM6izbKV9qoToZFGT++O/+Tx35Erux6OOns8L8zW3nAZR55q2OgLdf4mk4kaYBhKIECntwYAuLtT7LiMXUA3V2ep9TqvsH24aesH3feST4Sdgj2Ncqq8vfYqBFXqctNbpKv4wI0oGRoDdSSbb75CMNGCM/gPWVYfO2W7AVnSEUibr0BtnyvLl/eolEJrgn9OjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQf2mLT8nEDomFx1vSksNDgE4P/y6dRHW/lHIpdjL2M=;
 b=lTnOipwy8h5kmYmJxr3jkMG9GQAf4nw3Aug5+gGscd/Et+TAfOXqcyt+fziKhhig+X+CJr+vTMMsa/qX2yqwXw7NFHJKJEe3Rdyb+FoakZj6glW/BtfpwHSAqaUaDMrFTS4xj2RWIpEEyuIoqsSmJzddRRxraVieJPtN2ofz7Ts=
Received: from HK0PR03MB3089.apcprd03.prod.outlook.com (2603:1096:203:42::22)
 by HK2PR03MB4369.apcprd03.prod.outlook.com (2603:1096:202:1c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.8; Thu, 21 Oct
 2021 10:24:52 +0000
Received: from HK0PR03MB3089.apcprd03.prod.outlook.com
 ([fe80::286b:ebae:e833:16ae]) by HK0PR03MB3089.apcprd03.prod.outlook.com
 ([fe80::286b:ebae:e833:16ae%5]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 10:24:51 +0000
From: CS20 CHMa0 <CHMA0@nuvoton.com>
To: Patrick Williams <patrick@stwcx.xyz>, Matt Spinler <mspinler@linux.ibm.com>
Subject: RE: [phosphor-logging] About the "Stop emitting Entry propChanged
 before ifacesAdded" change reason
Thread-Topic: [phosphor-logging] About the "Stop emitting Entry propChanged
 before ifacesAdded" change reason
Thread-Index: AdfFhjh669KnwuGoRpm4ZK5IylzMDAAPsNYAAARZHgAAI3xdEA==
Date: Thu, 21 Oct 2021 10:24:51 +0000
Message-ID: <HK0PR03MB30898D4796237BBF74B874A9F5BF9@HK0PR03MB3089.apcprd03.prod.outlook.com>
References: <HK0PR03MB3089CFCA31102DE7BB551413F5BE9@HK0PR03MB3089.apcprd03.prod.outlook.com>
 <b71bb325-cf41-deab-5422-11520f85cc55@linux.ibm.com>
 <YXBPMNi5yzzEtE/R@heinlein>
In-Reply-To: <YXBPMNi5yzzEtE/R@heinlein>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f49efb7e-f948-4816-0b5a-08d9947d0496
x-ms-traffictypediagnostic: HK2PR03MB4369:
x-microsoft-antispam-prvs: <HK2PR03MB4369D75DC84A502F742B1540F5BF9@HK2PR03MB4369.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LXCQcXIu7XWjetP+pYWZ/JunFobo2XCFSyu4HI522bl6mIWXeyEvAnd9GUwrC7Jrw/5okIbjh7Fkud3n+4lVL99zceV/yYzeU2ECbUxKzbC9nquab1/LoLxCPRjBrLASKo9JC9VLproYLVRzIKTwksVS9jtlYqo1LQdmLzvoEEqz+Jp5Y61kWm1+sYYl6u7rZXc9Rr8PSzp/J3Olhmgu8u9K9XfHHlLS6YChCjYlXvPzMdyEcVgIHbZd6QfkNZfzHXikSkdCqhQo+sJi9Jb2STKid0Vn9/eQ2/5FDqIGtMsXgyYPiwAyt+zSfnhQQhVtZyQyNHUdvmHgedJ5m+QTCEl4MIQRQ1eLxUWg1TQcMb13yQglgOLdS/I+/Foa2CMaIOJCAK5Ky6O69fmk24CQkIgh/YaH0+sWGoUE1ZECnr3654dyrTvjDRu9QHX3eUuyILUYkQTUF5uAjIh4fVUJuziPMnANlkRYEhwqM8PDBLXkVxQlAS7ikJvVi+tIeP8MllCLyi5A4vpVpYAOen0mQQn3WAVptSuLjjbs6Lyzeqz+DCNDxuGbhfaXIOW/hkVbC/GauJwlQrxF594wZIKnEoTL0ZY5LYW254F9mrXX/6wYRMNPVlmPT2ir6HcXM/yFQ2hAUXWiqxjcd7l8ys1Bpvhi0Pyz6PVgihB2gkt5XSwQNXbNIEL8Pq6HGwH+IK/AFrytwTumaOf3LxBcLGxLKS0EoQsA2d/kO/3+wR8e2D/dhGfNDLbv+GwAWMhdqyXEvjZpiyWEnqgZjpjq2GwV6cPwaxLPnCni4Td2HA8NB3k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3089.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9686003)(55016002)(6506007)(8676002)(86362001)(66556008)(76116006)(966005)(8936002)(64756008)(71200400001)(66446008)(508600001)(38070700005)(2906002)(66476007)(53546011)(52536014)(7696005)(5660300002)(122000001)(38100700002)(26005)(107886003)(33656002)(66946007)(4326008)(54906003)(186003)(316002)(110136005)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?laAiC+1PyzQ4pnMzCuESwujYYuJ9mY5b//zDYQodrulDqLUTnyf3rH5bwb?=
 =?iso-8859-1?Q?oPpvD3vSo15CAY4QyXWRveGSZMZE2l+NGRPdnTCDfq3kUOewdEGfuMuw/c?=
 =?iso-8859-1?Q?QGMVozdMiwO/MagxuxkncR0setAFe3cyNw2TJih2RBm3Rt3zjRV05KyTq/?=
 =?iso-8859-1?Q?A+9F8pnAreGESCzxGz2FBBcHejWoW9SePqBGdtH0UTn1cAAWN5JXVZ7cm6?=
 =?iso-8859-1?Q?dv0Q9ENqOlUISG2HayLNLU58ktH88e/Aiy09Z7XlVug4QqEm608qCAZ3Y4?=
 =?iso-8859-1?Q?R/4Lk7rGWxgEWt9sV13fDLia4NEoSQqDfwA7YY/nYndG7/o6f2X2G96BEc?=
 =?iso-8859-1?Q?JKsSvKhrSEogAhcf4FeMXeS4GGAtaeXtFzc/R7But9A74LfX+1j4ujejP3?=
 =?iso-8859-1?Q?RB9aKUj7odQpKrLv54nzQJcsruQKlFf4ZMHqQ/65FJo1gaah3TvThTPa0K?=
 =?iso-8859-1?Q?tPC9gnzFpS7UthdQFx6HGsqUPowzHqFnXkHZxzJ1nbJjrwrUCIEWm+vHZz?=
 =?iso-8859-1?Q?U899Ga2PjGGCWG41nW7AdVGqnTK86y0sWLVq16A4YeZPhJmv7qhZvo7Pk2?=
 =?iso-8859-1?Q?tR38Dfm4StYVpZq4zmnhoAKFdWXd1b1Ix3F/NoAUcHDzrJDyOmIh7TmGYe?=
 =?iso-8859-1?Q?aXIcIMNMD2fSHNiSFeegRPHFAtXw6hzECYei+OB3GiMwvTUsTGv9UAiPNs?=
 =?iso-8859-1?Q?3bCF2zKiYeLHgFJOtzfG6AXqIYQax2xcCmNX5CNi1A1/PB6g8cwBiPK3lp?=
 =?iso-8859-1?Q?aU9GQ1HHIu+KmwFn68RTDV73lTmUfzmL4nX0twe01lwlNKIqE0rDN1x9JN?=
 =?iso-8859-1?Q?t3yhXvqdCmcI1u826+dG4P1taaRPAc0ZrBTJIGuPb6aflsJVvJwprMH5DQ?=
 =?iso-8859-1?Q?+YMFA09StlJMWh0C51z8PnLE9Zzs/SflvzIIlANSE5TOllR92NkrfIFPKI?=
 =?iso-8859-1?Q?QZd46mETECm4d1rG+a3fiINKwCaIctFYD7CLaJ+GHdKSs6Fy6KA3DrU1sW?=
 =?iso-8859-1?Q?UOqN7Ck+fWbd70FyvseoeDMQdmYbdOofvjR7jaaNPZjYEECkvhkv9NHqli?=
 =?iso-8859-1?Q?zkGK1073fidydMtzyZjU6qQvR54IRQALj7K7nQ56Yw6IckKiA4NZO8OZNB?=
 =?iso-8859-1?Q?9ZeqUpDzajYmFt3CNrV+MEITgrnPGsNg20BzL74rE54aqr77PzcQcwN1y5?=
 =?iso-8859-1?Q?vCp5H17rV+5oLwVdzEE38UhTT6P+q3ZNtttv97CE0BSQCSVuN/il6adwx+?=
 =?iso-8859-1?Q?Wr412aVex7kRrc10Yqk8wzcpfW5uffErdqQynMtO+vR99KjRba1pvpsgQO?=
 =?iso-8859-1?Q?XBekF7scm9lxBD6silfPQNM82Gs19i/mrb/EW+c0m5pFeZWEfhcI2wRdD9?=
 =?iso-8859-1?Q?J9bN1W5v7BAoigdutvLzeXE6FlUrwAZW4aXjurGqvnaCNk/1hWNJDedrkP?=
 =?iso-8859-1?Q?GMcbR44pWttNKPNZzTyqKTpUhUWo4BwLeMg+ncMjG32JKC9fq7XaUsjzju?=
 =?iso-8859-1?Q?k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3089.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49efb7e-f948-4816-0b5a-08d9947d0496
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 10:24:51.7301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHMA0@nuvoton.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4369
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
Cc: CS20 KWLiu <KWLIU@nuvoton.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Matt and Patrick,
Thanks for your apply, it seems very reasonable.
I think the bmcweb code need some update to avoid using wrong behavior.

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
