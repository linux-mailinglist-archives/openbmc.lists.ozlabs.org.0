Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 461CA7E776B
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 03:27:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=wzSDqWxU;
	dkim=pass (1024-bit key; unprotected) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=lwQ86vLx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRN5H122Rz3cb7
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 13:27:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=wzSDqWxU;
	dkim=pass (1024-bit key; unprotected) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=lwQ86vLx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=marco.cardellini@microchip.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Fri, 03 Nov 2023 19:39:29 AEDT
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SMDgj5hsKz2xwD
	for <openbmc@lists.ozlabs.org>; Fri,  3 Nov 2023 19:39:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1699000769; x=1730536769;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=huAfGo1FaPfpb1cVJprcTcT0EXzFubdrGiCh092X7bs=;
  b=wzSDqWxU+zWtdVoQZY+VT1GC67IEXSK3cvepQ0Oi5/B5XXjdGzh3Pj1c
   09AGt7dKEdwc8Wl9/R7bLZEvv/H6qsmrjEFIvb/ArkoY7o43+hnX3wYAy
   camkyqlOV/qDPlcrJ7QFyNQgSbLHTY1Jrkb0Abs1U+cH4KFczCCgw03mH
   tAN+sNNeBKxaYVDiUyU8uV9TRZJiWFe6H+zJRIYWwAv05281/UB2fkbN0
   wUqlapZ/H95veeuu4QOzL3xJZt3H1zhz0Y+KTcm5eAf7AGlNWcoMiaA+l
   JAzR0woAxu6CQdrodFfZozRGgvtnU+1E+o+cORQfQjSeCsGc1HFwd3SiQ
   Q==;
X-CSE-ConnectionGUID: 8TQZkdIxQrKnVGMisYM+9w==
X-CSE-MsgGUID: XHSRXGmCQTOio/0jr+FAKg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="png'150?scan'150,208,217,150";a="11077470"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Nov 2023 01:38:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Nov 2023 01:37:57 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Nov 2023 01:37:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVS+2bO6c/X4nR/JGSSRj18AogrPa/E1FD9g4YzBfF5DJl/eyubo09xOK3M2z5uDTWcxNJDx5HuIrXPdYDZh2y/doErAHitSDOt2ans1vB3EDdB7PEd+nQ0Fow+ePL7+9OoJ/SV01vJcheotBSyN5hfQZnSxvD2BqYqjGVHPaxpGLWwLEt6xmm00UpKs6m0Uok+SzDscsoZfe/xAScmi/DvENsYQU6elzcadWC/2+O57+F0F4PnhxtUNTC+f2Zc0xOlDoFaRhXkfAGLKAux3oi6JMcwRYq4ZLfvQfeH15IfODVM5N7/MCoSLIbbVXzQOXhkSapHqTo/nflU1Aa4uPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8gJcKTq1XD+pY2jdEjA7etR4HtgCME/x4uIIzAwrtg=;
 b=SstSAfP1YRAHRyR1/4XqbodjZ4Ua4HcAYVx/EYcn25HR2YC+ctm6Qz2BWcJ8SiQF19bGA8YANu9thbFtkyOCcKwNDhN0ib5TegwVQppflRabEp6+DTkckElg57kGk7ffjD40GV1waZa08naq7FXfrzMzHe98HYY6ZgMx/MQDepLuz7V2VMqihtL8adtqCSiLVUdNWlQqzjopqscJK6xhJqHdnZ563pzCLOzFXs00Q6ImiX4mZsu5jrlbsavvbspOyxQOTTV1eGFKc0vpMN4BfPQM8+q8BE9Je6K0820rvy9V2IMvahKQQiA9AhT1QQ1hMsQbgCZJXEXzd/eefP2BBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8gJcKTq1XD+pY2jdEjA7etR4HtgCME/x4uIIzAwrtg=;
 b=lwQ86vLxH816CNflFYUE348H/yMOr/6F5Caq9+eWxR8tzggC9FgmJUO3enBoyReBsWkysdXmqQuIdD8UHuuni6wrMTR1ol4nUERdEyI02HlX2A7me5AFBRx52pvSIGB64ADSj9jFRASy+gOysp9jg3e9Dws/AHlEtw7/kS3i5OE=
Received: from PH0PR11MB5062.namprd11.prod.outlook.com (2603:10b6:510:3e::12)
 by SN7PR11MB7137.namprd11.prod.outlook.com (2603:10b6:806:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 08:37:55 +0000
Received: from PH0PR11MB5062.namprd11.prod.outlook.com
 ([fe80::87f0:1510:414f:d6ff]) by PH0PR11MB5062.namprd11.prod.outlook.com
 ([fe80::87f0:1510:414f:d6ff%3]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 08:37:55 +0000
From: <Marco.Cardellini@microchip.com>
To: <patrick@stwcx.xyz>, <geissonator@gmail.com>
Subject: FW: OpenBMC support for SAM9X75 - follow up
Thread-Topic: OpenBMC support for SAM9X75 - follow up
Thread-Index: AQHaDaewtlGOK5Q9m027XMHYz8VJErBnxqAAgAB7sPCAAAAaMA==
Date: Fri, 3 Nov 2023 08:37:55 +0000
Message-ID: <PH0PR11MB5062741391DA033DA8BB240F9EA5A@PH0PR11MB5062.namprd11.prod.outlook.com>
References: <BYAPR11MB35910AD28FB4793C988DFFB5F3DDA@BYAPR11MB3591.namprd11.prod.outlook.com>
 <IA1PR11MB79188B3F91CABC644F5A9DC6ECDDA@IA1PR11MB7918.namprd11.prod.outlook.com>
 <SJ0PR11MB50569E6F6F8B45AD0D85968E98DDA@SJ0PR11MB5056.namprd11.prod.outlook.com>
 <DM4PR11MB54708C439647F1FA0BD581CAEEDDA@DM4PR11MB5470.namprd11.prod.outlook.com>
 <SJ0PR11MB50567D3668198D7E85171D4198DDA@SJ0PR11MB5056.namprd11.prod.outlook.com>
 <DM4PR11MB5470CEBF6C42DB3555269FD5EEDDA@DM4PR11MB5470.namprd11.prod.outlook.com>
 <SJ0PR11MB5056283972C71AD9B030327F98DDA@SJ0PR11MB5056.namprd11.prod.outlook.com>
 <DM4PR11MB54700AF4648C4A892E0DE879EEDDA@DM4PR11MB5470.namprd11.prod.outlook.com>
 <IA1PR11MB7918002DB77F28F1D584A232ECDDA@IA1PR11MB7918.namprd11.prod.outlook.com>
 <DM4PR11MB54704F112382D43BDFC2F898EEDCA@DM4PR11MB5470.namprd11.prod.outlook.com>
 <PH0PR11MB5062973F2689347ACBB44B369EA0A@PH0PR11MB5062.namprd11.prod.outlook.com>
 <DM4PR11MB547038DD545F8C702FA6011BEEA7A@DM4PR11MB5470.namprd11.prod.outlook.com>
 <PH0PR11MB50623E55C582689F9A7336199EA6A@PH0PR11MB5062.namprd11.prod.outlook.com>
 <DM4PR11MB5470969CC94F9A219F5DFF9DEEA5A@DM4PR11MB5470.namprd11.prod.outlook.com>
 <PH0PR11MB50621C4604EFE68563B3E8069EA5A@PH0PR11MB5062.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB50621C4604EFE68563B3E8069EA5A@PH0PR11MB5062.namprd11.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5062:EE_|SN7PR11MB7137:EE_
x-ms-office365-filtering-correlation-id: 8139f082-baf3-41fc-285c-08dbdc482ce7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OWSZVgie+uh57vvAy79dxX3BqhuqaEy8H0Ug9eG7kbZn616K3krIM3oZEoNVApdsFwqLfAvGVK/mFmcFmObXo32r1uKPqjkl0RNFQ/Rvyi5wIbbMpvdCtV9enFb34tSjw/fHv34RKuO9+paoP9eY08/bsOpE41lqGxYOIrOuNCur3kje3bFxAvn/nmQr5frhm5cdAgUELZYnFPpz4OMWmygysfbctsYk1v9HqCa37lcxrdapHNu9TDeTNRqN3+eeoodSPnxaZ7msUqFuiuwVfioPJoN64sfC9hroxgkxaLqy7Hqg1G4cTJyCL7r93P4K5Z4ecbPUg8YfXG8ZCbzp0bVFvpSYaGCFxzdXVaiNZqlC1D41CNi1EFu1jclfYDGKeWhGCoeYNCiOoka9l1hXK/uZp+3Ni3ia2jNjNu1g9M9UHme2dcn2/bf+LWBfZGInqDzD+HMmfTxUVSddCQWuzzmz+eCfZYar4u82UIb2RclhOiZzkLRn+LwC2RDYzK49s1euk7q+9bU1wS8F2PabD0BH5IbuvcdQ4IlvtB0IZXM2FZENleHBOTrZL4sq9b+UZbafE+6c4F7oox5tXJRUQUchnKD9r5AAmdnTQdJ+UaQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5062.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(66556008)(64756008)(66446008)(54906003)(316002)(76116006)(66946007)(66476007)(110136005)(38070700009)(6506007)(9686003)(71200400001)(2940100002)(7696005)(107886003)(26005)(38100700002)(166002)(99936003)(122000001)(33656002)(86362001)(478600001)(966005)(8676002)(4326008)(52536014)(8936002)(41300700001)(5660300002)(55016003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GN0zySdXvwM6/yAXllLQMewl9Puq1Pf2fb1fLKE4HngWEDm+iI2cQ4aBte?=
 =?iso-8859-1?Q?T+rnw5tvVMVVdRPLJVaPKXWe3+eFvR1meC0Cq9NEfWlcR49vjr694P2kTr?=
 =?iso-8859-1?Q?wrYQbIkBVVxCrbNzOk0k18A9txRqwChDMn95GhERXiu0Ei/r2sMzd0hcDm?=
 =?iso-8859-1?Q?vvNAPsAiAR70wEFr1eM/OxqJDY/w1d9jq2TxDndIObHIhszSodvRucqHYH?=
 =?iso-8859-1?Q?NifSx7TpwDAp5kmDmPRsQR5HSOXJGtZFtseGJSKjPY4xn3SMrdwj91GiyE?=
 =?iso-8859-1?Q?1Al+tZPoDYhLIvKL9xfnM6B2eVC9U/7TfZnozkHd174wy+LXQUidFDrc2x?=
 =?iso-8859-1?Q?FWGt4eBBFNc7fQUYoMz3vzpCXV6nUB4TaftETFs5D5K8cSf4mIEySbV56v?=
 =?iso-8859-1?Q?kFjDRZyUuWQIIFt44MN2urTL8mlZDbABU20lkATLuEqpysu5neLHG96eyo?=
 =?iso-8859-1?Q?PBjXXZGCF290zeZwRGHdK2fjbFxwwFDF+vlIFxBD44bahLt93/QdlTElve?=
 =?iso-8859-1?Q?F2oiHOlOWzeR3BVpMLXfgmO2iKT/qw30fvMnhl1m+XFRgCFby3d1mEALal?=
 =?iso-8859-1?Q?8i4WE4xJFoiylGQHsSM05OGhC3FmKUPOIEutngxxRLwQA8373l5MSnG9ZT?=
 =?iso-8859-1?Q?IzBC0zTi5KMnKaBtCDENMq8jxLa/EBicFF3XD6xBB5VNkTTTQpzVJOXQyd?=
 =?iso-8859-1?Q?OUFoas8gZVRi83fqs+Sw34bsoWT/RVYWlmrjzjTKFn/6321qQNedykn8eD?=
 =?iso-8859-1?Q?YpXviU1ff1UGc5jHMuoQBeAyoa3J/EvMe7aIyNlq+Ct0WYlm05tSr9elWL?=
 =?iso-8859-1?Q?1f4fm5d9iKSJ6nzqe3rib2S9FCzzBL8QrfxsEu1O34J7HxVjU5MDI7/SOU?=
 =?iso-8859-1?Q?BFO1SxFhAudxODXQMB0lezmIx9Y6UKt0hg93i2Y+qC1Rwu0p9ZVyY5pvqS?=
 =?iso-8859-1?Q?IRfpPXkrmeeE1Z1YYVcG3B4EoGdUnM5rQBoj6Qb5ZPzqnMgwHbg+gV0qAS?=
 =?iso-8859-1?Q?Sl+M1icEZSUkdU9aPVAvxRXDIWSiDKSBbhbconzwH/mcK6diLvyuSe54Mu?=
 =?iso-8859-1?Q?yoXLBY+K5WpEaY+gP2lUB2KEka9Nb6FytaH/taFK2ASKBNUwjIhQp+deXY?=
 =?iso-8859-1?Q?IqNJ1T+OJcObs4Gd64TyKJ3S94WYxMkUO/dq50FAVr4iWxX2daiovpCzCD?=
 =?iso-8859-1?Q?q8WBAEyv3GwO8VteAtNGGjMUmBqESAU+PNbAmq6tux+PKfyKicvr1zLAH3?=
 =?iso-8859-1?Q?woHBvPUeSGWhi0ENQ1+UG2AUloJr+HJbpfI/gSH2G+BQzQxKMSA6zH27NF?=
 =?iso-8859-1?Q?8M+Fwb8iUdh67UmZhuXIkXH0caiizWcqsgmPz8RADnaw7EP+0marhkST6q?=
 =?iso-8859-1?Q?ocucxxKXtyxYXk6yyGLbmc6IRHv+HKaxS7LlQk0XDat4GUl3/k/PiAClS8?=
 =?iso-8859-1?Q?d30bUEcFLfzdQWTPi5sZ0D94bvpdvQ9Hhx0CeT8M48dFf2QWle0m720XLh?=
 =?iso-8859-1?Q?C0BqFuL7YL3KGF5YqeWJLMiIL757DAWqUR7gmozMQpYgN1GHB4jq1apYtt?=
 =?iso-8859-1?Q?Tg6qF2VEHEKs/mgQySPar97MrIl5cW7whR4Jf3cpa1XPe0RRs5wXEPcYKU?=
 =?iso-8859-1?Q?0tWp648qoEh/K6gHlju1+wNqCKsilYP45dUdF6bKlZqVoRutiV2y6cUA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/related;
	boundary="_004_PH0PR11MB5062741391DA033DA8BB240F9EA5APH0PR11MB5062namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5062.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8139f082-baf3-41fc-285c-08dbdc482ce7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 08:37:55.2144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JQHrDRZ/hvFDWy1YQ3fV+n/hHmPEUY/IE4FBWSUCcNsJwOMDu70wZP9M2TkL68ph0qDqy1FVKAoxaiqnu2lR5991nyV3NTVaF8nxQY+w0BQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7137
X-Mailman-Approved-At: Fri, 10 Nov 2023 13:23:51 +1100
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
Cc: openbmc@lists.ozlabs.org, Hakim.Cherif@microchip.com, Marco.Cardellini@microchip.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_PH0PR11MB5062741391DA033DA8BB240F9EA5APH0PR11MB5062namp_
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5062741391DA033DA8BB240F9EA5APH0PR11MB5062namp_"

--_000_PH0PR11MB5062741391DA033DA8BB240F9EA5APH0PR11MB5062namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Patrick, Andrew

Many thanks for your feed back but we are not sure to understand your answe=
r.
.
Does it mean openBMC team will keep updating their code based on any yocto =
release?

Checked the wiki, kirkstone is the latest LTS version of yocto. https://wik=
i.yoctoproject.org/wiki/Releases
Codename
Yocto Project Version
Release Date
Current Version
Support Level
Poky Version
BitBake branch
Maintainer
Scarthgap
5.0
April 2024
Future - Long Term Support (until April 2028)
N/A
2.8
Richard Purdie richard.purdie@linuxfoundation.org<mailto:richard.purdie@lin=
uxfoundation.org>
Nanbield
(like 'man field')
4.3
October 2023
Future - Support for 7 months (until April 2024)
N/A
2.6
Richard Purdie richard.purdie@linuxfoundation.org<mailto:richard.purdie@lin=
uxfoundation.org>
Mickledore
4.2
May 2023
4.2.3 (September 2023)
Support for 7 months (until November 2023)
N/A
2.4
Steve Sakoman steve@sakoman.com<mailto:steve@sakoman.com>
Langdale
4.1
October 2022
4.1.4 (May 2023)
EOL
N/A
2.2
Steve Sakoman steve@sakoman.com<mailto:steve@sakoman.com>
Kirkstone
(like 'kirk stun')
4.0
May 2022
4.0.13 (October 2023)
Long Term Support (Apr. 2026=B9)
N/A
2.0
Steve Sakoman steve@sakoman.com<mailto:steve@sakoman.com>

From openBMC github, we can see Kirkstone, Langdate, and Mickledone branche=
s
[cid:image003.png@01DA0E33.BE57FF90]


Did openBMC team mean if we want to put our meta (meta-atmel) to openBMC gi=
thub, we have to follow every version from yocto release?
Is there any quick way if we integrate our meta to kirkstone branch?

https://github.com/linux4sam/meta-atmel/tree/sam9x7_early

How we could do to support openBMC for our sama9x7 device ?


Thanks again for your support
Best regards
Marco



--_000_PH0PR11MB5062741391DA033DA8BB240F9EA5APH0PR11MB5062namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:Gulim;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"\@MS PGothic";}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"\@Gulim";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"MS PGothic",sans-serif;
	mso-fareast-language:JA;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"purple" style=3D"word-wrap:b=
reak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW">Hi Patrick, Andrew<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW">Many thanks for your fee=
d back but we are not sure to understand your answer.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW">.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW">Does it mean openBMC tea=
m will keep updating their code based on any yocto release?<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW">Checked the wiki, kirkst=
one is the latest LTS version of yocto.
</span><a href=3D"https://wiki.yoctoproject.org/wiki/Releases"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-fareast=
-language:ZH-TW">https://wiki.yoctoproject.org/wiki/Releases</span></a><spa=
n style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-=
fareast-language:ZH-TW"><o:p></o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"background:#F8F9FA;border-collapse:collapse">
<tbody>
<tr>
<td style=3D"border:solid #A2A9B1 1.0pt;background:#EAECF0;padding:2.4pt 4.=
8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"mso-margin-top-alt:12.0pt;=
margin-right:0in;margin-bottom:12.0pt;margin-left:0in;text-align:center">
<b><span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;=
color:#202122;mso-fareast-language:ZH-TW">Codename<o:p></o:p></span></b></p=
>
</td>
<td style=3D"border:solid #A2A9B1 1.0pt;border-left:none;background:#EAECF0=
;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"mso-margin-top-alt:12.0pt;=
margin-right:0in;margin-bottom:12.0pt;margin-left:0in;text-align:center">
<b><span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;=
color:#202122;mso-fareast-language:ZH-TW">Yocto Project Version<o:p></o:p><=
/span></b></p>
</td>
<td style=3D"border:solid #A2A9B1 1.0pt;border-left:none;background:#EAECF0=
;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"mso-margin-top-alt:12.0pt;=
margin-right:0in;margin-bottom:12.0pt;margin-left:0in;text-align:center">
<b><span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;=
color:#202122;mso-fareast-language:ZH-TW">Release Date<o:p></o:p></span></b=
></p>
</td>
<td style=3D"border:solid #A2A9B1 1.0pt;border-left:none;background:#EAECF0=
;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"mso-margin-top-alt:12.0pt;=
margin-right:0in;margin-bottom:12.0pt;margin-left:0in;text-align:center">
<b><span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;=
color:#202122;mso-fareast-language:ZH-TW">Current Version<o:p></o:p></span>=
</b></p>
</td>
<td style=3D"border:solid #A2A9B1 1.0pt;border-left:none;background:#EAECF0=
;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"mso-margin-top-alt:12.0pt;=
margin-right:0in;margin-bottom:12.0pt;margin-left:0in;text-align:center">
<b><span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;=
color:#202122;mso-fareast-language:ZH-TW">Support Level<o:p></o:p></span></=
b></p>
</td>
<td style=3D"border:solid #A2A9B1 1.0pt;border-left:none;background:#EAECF0=
;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"mso-margin-top-alt:12.0pt;=
margin-right:0in;margin-bottom:12.0pt;margin-left:0in;text-align:center">
<b><span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;=
color:#202122;mso-fareast-language:ZH-TW">Poky Version<o:p></o:p></span></b=
></p>
</td>
<td style=3D"border:solid #A2A9B1 1.0pt;border-left:none;background:#EAECF0=
;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"mso-margin-top-alt:12.0pt;=
margin-right:0in;margin-bottom:12.0pt;margin-left:0in;text-align:center">
<b><span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;=
color:#202122;mso-fareast-language:ZH-TW">BitBake branch<o:p></o:p></span><=
/b></p>
</td>
<td style=3D"border:solid #A2A9B1 1.0pt;border-left:none;background:#EAECF0=
;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"mso-margin-top-alt:12.0pt;=
margin-right:0in;margin-bottom:12.0pt;margin-left:0in;text-align:center">
<b><span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;=
color:#202122;mso-fareast-language:ZH-TW">Maintainer<o:p></o:p></span></b><=
/p>
</td>
</tr>
<tr>
<td style=3D"border:solid #A2A9B1 1.0pt;border-top:none;padding:2.4pt 4.8pt=
 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">Scarthgap<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">5.0<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">April 2024<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">Future - Long Term Support (until Ap=
ril 2028)<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">N/A<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">2.8<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">Richard Purdie
</span><span style=3D"color:black"><a href=3D"mailto:richard.purdie@linuxfo=
undation.org"><span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,=
sans-serif;mso-fareast-language:ZH-TW">richard.purdie@linuxfoundation.org</=
span></a></span><span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot=
;,sans-serif;color:#202122;mso-fareast-language:ZH-TW"><o:p></o:p></span></=
p>
</td>
</tr>
<tr>
<td style=3D"border:solid #A2A9B1 1.0pt;border-top:none;padding:2.4pt 4.8pt=
 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">Nanbield<br>
(like 'man field')<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">4.3<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">October 2023<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">Future - Support for 7 months (until=
 April 2024)<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">N/A<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">2.6<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">Richard Purdie
</span><span style=3D"color:black"><a href=3D"mailto:richard.purdie@linuxfo=
undation.org"><span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,=
sans-serif;mso-fareast-language:ZH-TW">richard.purdie@linuxfoundation.org</=
span></a></span><span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot=
;,sans-serif;color:#202122;mso-fareast-language:ZH-TW"><o:p></o:p></span></=
p>
</td>
</tr>
<tr>
<td style=3D"border:solid #A2A9B1 1.0pt;border-top:none;padding:2.4pt 4.8pt=
 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">Mickledore<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">4.2<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">May 2023<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">4.2.3 (September 2023)<o:p></o:p></s=
pan></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">Support for 7 months (until November=
 2023)<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">N/A<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">2.4<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">Steve Sakoman
</span><span style=3D"color:black"><a href=3D"mailto:steve@sakoman.com"><sp=
an style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fa=
reast-language:ZH-TW">steve@sakoman.com</span></a></span><span style=3D"fon=
t-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#202122;mso-far=
east-language:ZH-TW"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"border:solid #A2A9B1 1.0pt;border-top:none;padding:2.4pt 4.8pt=
 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:slategray;mso-fareast-language:ZH-TW">Langdale<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:slategray;mso-fareast-language:ZH-TW">4.1<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:slategray;mso-fareast-language:ZH-TW">October 2022<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:slategray;mso-fareast-language:ZH-TW">4.1.4 (May 2023)<o:p></o:p></span>=
</p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:slategray;mso-fareast-language:ZH-TW">EOL<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:slategray;mso-fareast-language:ZH-TW">N/A<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:slategray;mso-fareast-language:ZH-TW">2.2<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:slategray;mso-fareast-language:ZH-TW">Steve Sakoman
</span><span style=3D"color:black"><a href=3D"mailto:steve@sakoman.com"><sp=
an style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fa=
reast-language:ZH-TW">steve@sakoman.com</span></a></span><span style=3D"fon=
t-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;color:slategray;mso-f=
areast-language:ZH-TW"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"border:solid #A2A9B1 1.0pt;border-top:none;padding:2.4pt 4.8pt=
 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">Kirkstone<br>
(like 'kirk stun')<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">4.0<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">May 2022<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">4.0.13 (October 2023)<o:p></o:p></sp=
an></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">Long Term Support (Apr. 2026=B9)<o:p=
></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">N/A<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">2.0<o:p></o:p></span></p>
</td>
<td style=3D"border-top:none;border-left:none;border-bottom:solid #A2A9B1 1=
.0pt;border-right:solid #A2A9B1 1.0pt;padding:2.4pt 4.8pt 2.4pt 4.8pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:12.0pt;margin-right:0in;=
margin-bottom:12.0pt;margin-left:0in">
<span style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;col=
or:#202122;mso-fareast-language:ZH-TW">Steve Sakoman
</span><span style=3D"color:black"><a href=3D"mailto:steve@sakoman.com"><sp=
an style=3D"font-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;mso-fa=
reast-language:ZH-TW">steve@sakoman.com</span></a></span><span style=3D"fon=
t-size:9.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#202122;mso-far=
east-language:ZH-TW"><o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW">From openBMC github, we =
can see Kirkstone, Langdate, and Mickledone branches<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW"><img border=3D"0" width=
=3D"372" height=3D"562" style=3D"width:3.875in;height:5.85in" id=3D"Picture=
_x0020_3" src=3D"cid:image003.png@01DA0E33.BE57FF90"></span><span style=3D"=
font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-lan=
guage:ZH-TW"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW">Did openBMC team mean if=
 we want to put our meta (meta-atmel) to openBMC github, we have to follow =
every version from yocto release?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW">Is there any quick way i=
f we integrate our meta to kirkstone branch?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/linux4sam/meta-atmel/t=
ree/sam9x7_early">https://github.com/linux4sam/meta-atmel/tree/sam9x7_early=
</a><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-se=
rif;mso-fareast-language:EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW">How we could do to suppo=
rt openBMC for our sama9x7 device ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:ZH-TW">Thanks again for your su=
pport<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Best regards<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Marco</span><span style=3D"font-family:&quot;PMingL=
iU&quot;,serif;mso-fareast-language:ZH-TW"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;mso-fareast-language:EN-US"><o:p>&nbsp;</o:p></span>=
</p>
</div>
</body>
</html>

--_000_PH0PR11MB5062741391DA033DA8BB240F9EA5APH0PR11MB5062namp_--

--_004_PH0PR11MB5062741391DA033DA8BB240F9EA5APH0PR11MB5062namp_
Content-Type: image/png; name="image003.png"
Content-Description: image003.png
Content-Disposition: inline; filename="image003.png"; size=31140;
	creation-date="Fri, 03 Nov 2023 00:59:14 GMT";
	modification-date="Fri, 03 Nov 2023 08:37:54 GMT"
Content-ID: <image003.png@01DA0E33.BE57FF90>
Content-Transfer-Encoding: base64

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
LuBh5d7uAAAAAElFTkSuQmCC

--_004_PH0PR11MB5062741391DA033DA8BB240F9EA5APH0PR11MB5062namp_--
