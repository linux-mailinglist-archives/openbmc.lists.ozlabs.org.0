Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DE2846291
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 22:24:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=Z47muCGk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQsNM4ZxQz3cBK
	for <lists+openbmc@lfdr.de>; Fri,  2 Feb 2024 08:24:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=Z47muCGk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asus.com (client-ip=103.10.4.13; helo=ms.asus.com; envelope-from=prvs=7549cd68c=kelly_hung@asus.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 01 Feb 2024 20:23:46 AEDT
Received: from ms.asus.com (ms.asus.com [103.10.4.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQYPG4ggQz3cYQ
	for <openbmc@lists.ozlabs.org>; Thu,  1 Feb 2024 20:23:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asus.com; i=@asus.com; q=dns/txt; s=asuscom;
  t=1706779427; x=1738315427;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Za2OrrKhaF5hKfrhTOBl3qD7EWrwsv+GGWaJE74ASh4=;
  b=Z47muCGk7c/O3Iu9vD/t7ogxoBwM8p61uj7fu8hpMH7cNddlDizBf3lB
   fhxiTqR3TlSnvkJg5iz+69wO5P8ccRu/dPZyxpheIr9WX6Ern3gFypsOv
   DRpakoZLXDogFc8Na6Lhqkkjczg75b7yiL+oOLuuuAiyLq9pa/vDNVy5M
   4=;
X-IPAS-Result: =?us-ascii?q?A2FiAABkYbtl/xEvFqxaHQEBAQEJARIBBQUBSYE0BgELA?=
 =?us-ascii?q?YI4eoFhhFORZQOLXpBRKoEsFIFfCw8BAQEBAQEBAQEHAQEuFgQBAYUBAwICF?=
 =?us-ascii?q?odAJzYHDgECBAEBAQEDAgMBAQEBAQEIAQEBBQEBAQEBAQYEAQEBAoEZhS9Kg?=
 =?us-ascii?q?lwBg20BAQEBAgEBCyhFBQcEAgEGAg0BAwQBAQUoAgIeBwodCAIEAQ0FCIUkA?=
 =?us-ascii?q?w4jmW+bOm0PgTAaZ4IWBLAdDYJVCQGBBzcBgWiGHx4Bg0GCLYNAe4JPJm9Ce?=
 =?us-ascii?q?W2BAj6CH4FnCAESASMFECECgxhCgi8EgTlcgz+DMoEoinBohDxUfx0DXigEX?=
 =?us-ascii?q?A0FFhAeNxEQEw0DCG4dAhEiOgMFAwQyChIMCyEFVQNABkkLAwIaBQMDBIEwB?=
 =?us-ascii?q?Q0aAhAaBgwmAwMSSQIQFAM4AwMGAwoxMFVBDFADZx8WHAk8CwQMGgIbGw0nI?=
 =?us-ascii?q?wIsQAMREAIWAyIWBDYRCQsmAyoGNgISDAYGBl0jFgkEJQMIBANUAyF0EQMEC?=
 =?us-ascii?q?gMUBwsHeoIJgT4EE0cQgTSEbwNEHUADC209NRQbBQQfAYEZBZsnE4EpEBAuA?=
 =?us-ascii?q?RNwKxVQERofRZIznWyUDXANgwuBA5ksgXuGKxeEBYx3hlsDkkWYVSCRS5ZcA?=
 =?us-ascii?q?gQCBAUCDgiBQCoCgR1wMz2DN1IZoiJ2OwIHAQoBAQMJgjuEDYImBS9nXwEB?=
IronPort-PHdr: A9a23:T8WUJxLrpJ4hWXr5dNmcuBdgWUAX0o4c3iYr45Yqw4hDbr6kt8y7e
 hCFtbM21QeCBN+Fo9t/yMPo8InYGlY8qa6bt34DdJEeHzQksu4x2zIaPcieFEfgJ+TrZSFpV
 O5LVVti4m3peRMNQJW2aFLduGC94iAPERvjKwV1Ov71GonPhMiryuy+4ZLebxtLiTanb75+M
 Qm6oQrMusUIgIZpN7o8xAbOrnZUdOtawn9lK0iUkxjg+Mm74YRt8z5Xu/Iv9s5AVbv1cqElR
 rFGDzooLn446tTzuRbMUQWA6H0cUn4LkhVTGAjK8Av6XpbqvSTksOd2xTSXMtf3TbAwXjSi8
 rtrRRr1gyoJKzI17GfagdFrgalFvByuuQBww4/MYIGUKvV+eL/dfcgHTmZFR8pdSjBNDp+5Y
 4YJEuEPP/tXr5PlqlUOsxWzGxSiBP/hxDFLiH/537E13esuHgzdwAwvBM4CvGjIoNnpN6cfV
 /2+wqnSzTXEavNbwTLz55bMchAlofCHQLB+cdfXyUkgEw/HiFOSq4rgMziI0ekDtnaU7+5kV
 eOvk2EpqRxxoj6gxso3kIbJnZ8Vykve+Splx4Y1IMS1RUhmatGrDJVerTuVN5dqQsw8WWFov
 j43xLMatZKnYCUG1ZsqyRHBZvKHcYWF4QzvWuiVLDpkmX5pZq6zihWv/EW+xePxWMe63lZIo
 ydZnNTAqnAD2hLc58WBV/Bz/V+h1C6S2w3R9O1IO144mbTBJ5MuwLM8jIcfvEbbEiPomUj6k
 KGbe0A59uS07+nqY7DrqoKAO4NpjwzxLqojl8m6DOglLgQDWXWQ9Pq41L3+5k35XKtFjucrn
 KnYsZHVO9wWqrK/DgRIyIgs8Qy/AC2j0NkAmHkHK09KdwyfgojyPlHOPOj4DfCig1SwiDtrx
 +7JPrnmApjVMHbNiq7tc7Fz5UJFxwU/0c1T64hIBbEGOvLzQknxu8LEDhMjKQO02PvnCM5l2
 oMfX2KAHLOZPbvPvVKK+O4jOfeAaJEPtDvyKfUp/ePigH0hlV8YZ6ap3J8XaH6iHvRhJkWUe
 X/ijckFEWcOvgsxVO7kiECEUT5cfHu9Rbk85iwgCI68EYjDQYWtjKSH3CigBpJWfHxJCkiQE
 Xf0cIWJQ/gBZDqIIsB9ijwESaShS4g52BGyrg/6yrxnLuvP9y0bspLj0sN15/DXlREx8jx4F
 diS02aIT21shGMHWyc23LxjoUx60lqDybB4g/1XFdxT4PNJTxw6OoDHwux1DtD9QAPBftOTR
 Fm6RdWmBCk9TsgtzN8Wf0Z9B9Kigwje3yazGLAVkLuLBIAv/6LY3njxPNp9y23c2KY8kVYmR
 MROOXe7iaFh7wTTHZLGk12Fl6a2cqQRxCnN9H+dwmqIp05YVRJ/XL7BXXAefUvWsc/56lnFT
 76vDbQoKBBOydWYJqtNcN3pggYOePC2BNPbK1iwnWb4UQqSx7WNRIntfX4A2CbaTkMDllZXt
 VWLMQwvTge8pW2WWCR2FF3vZF73/MFxrXq6Sgk/yATcPGN70L/g2RMRge3Ua+4V0fL8QN9g4
 2FXEVK5zuX2FtyPjwN6Yb4aatQ4tgQUnVnFvhBwa8TzZ5tpgUQTJkEu5xuGP11fBoZBlJ0sq
 3UnhEp3JLmD2VxMPzWfwdjrO7LRJ2WzmXLna6Pf1lzEltrD/KAJ5ac0rlz5t1SvEUwvu3xsz
 9hS1S6a4ZPHRAofWJ78SAA57R9/8rjBfzJ77ITRhhVR
IronPort-Data: A9a23:O7it2qjqiYlCrIL9FIOfHye4X161PxEKZh0ujC45NGQN5FlHY01je
 htvXm+DPq2OMzHxeo9xPYi29B8Gup7Xz9ZiSgQ+pCwyES4W8JqUDtmwEBz9bniYRiHhZBs8t
 p1BMLEsDyyWolv0/ErF3m3J8CEUOZmgH+a6UqifUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tqaT/f3YTdJ5hYtWo4qw/PbwP9QlKmq0N8olgRWTexGulbYi04UAPo3TU1mByCgKmX8NrfSq
 9frlNlVzEuAl/seIorNfoLAT6E/auW60T5iKpZhc/PKbhBq/kTe20ugXRYWQR8/Zz6hx7idx
 DjR3HAZpMhA0qDkwYwgvxdk/y5WA4FjxoLEelWFsO+f7heYXXjBx9NDAxRjVWEY0r4f7WBmy
 cRdDRxIUEjawemx2qq9R/Uqj98+N6EHPqtG5Ssml2ufUalgGM+rr6bivLe02B8Ti8RKDMH+e
 swWQTN0cQ+GaBpKUrsSIMhmw7rx3SKjIlW0rnqIvpQxvVHS5zV12ZjhLdraZcSkS4JayxPwS
 mXuuj6R7gshHMCFyDyE2nGrgPTSmSD8HokVEdWQ7uZrj12U23ceIBITXFq/5/K+jyaWRpdVL
 EsI0i4vtrQpskCmSMm7UxDQiHmcsxgWXtF4F+wh9BrLzbjQ6gyCQG8eQVZ8hMcO7ZBsA2Zwk
 APW2Yq2bdByjICopbum3u/8hVuP1eI9dgfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:MG1KeqNKT+9oC8BcT4/255DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjzjSWE9Qr4WBkb6LW90dq7MA/hHPlOkMQs1NaZLUPbUQSTXfhfBOfZsl7d8mjFh5RgPM
 RbAuRD4b/LfCBHZK/BiWHSebtAoOVvsprY/ts2p00dCz2CAJsQizuRfzzrdHGeMzM2YqbReq
 DshPZvln6FQzA6f867Dn4KU6zovNvQjq/rZhYAGloO9BSOpSnA0s+0LzGomjMlFx9fy7Yr9m
 bI1ybj4L+4jv29whjAk0fO8pVtnsf7wNcrPr3DtiFVEESstu+bXvUjZ1SwhkF2nAhp0idurD
 D4mWZhAy200QKUQoj6m2qr5+Cq6kdQ15ar8y7nvZKkm72peNrxY/Ax3L6wsXPimhIdVKsX6t
 MQ44rD3aAnUC8p2E/Glob1v9QDrDvunZLn+dRj00C2luMlGeBsRMUkjTJoOYZFEyTg5I89Fu
 5ySMna+fZNaFufK2vUp2913bWXLz0O9zq9Mz8/U/auok5rtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9EGKKMeyfwaAOJNHjXLUXsFakBNX6Io5nr4K8t7OXvfJAT1pM9lJ
 nITVsdv28vfEDlD9GIwfRwg1jwaXT4WS6oxtBV5pB/tLG5TL33MTebQFRriMekq+V3OLyuZx
 9yAuMiPxbOFxqdJW8S5XyPZ3B7EwhsbPEo
X-Talos-CUID: 9a23:RpoQEm0q0JUNRolvL/Nq8bxfJOwATEDel1rqImy0KDw3Zr64TXm99/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AIfs6Zw+1UKzWXknJVLAckQ+Qf9pz3aLwMUEmqJE?=
 =?us-ascii?q?Pm8WZNSNvIxmTyzviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from unknown (HELO TP-MD-V01.corpnet.asus) ([172.22.47.17])
  by ms.asus.com with ESMTP; 01 Feb 2024 17:22:32 +0800
Received: from APZA004TMD.corpnet.asus (172.22.47.64) by
 TP-MD-V01.corpnet.asus (172.22.47.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 17:22:32 +0800
Received: from APZA003EXB.corpnet.asus (172.22.6.15) by
 APZA004TMD.corpnet.asus (172.22.47.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 1 Feb 2024 17:22:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (104.47.26.40) by
 APZA003EXB.corpnet.asus (172.22.6.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Thu, 1 Feb 2024 17:22:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcLL/8AHRuUGoQu5tflmRU0V39vyvjMgML9uvDnFoOX37PBL+e2FZyUe1OCtcMm+NAp/76OOnq7PYpKCp9FG7xC1Zmei/OaAV2147nj0tzZKcgH1H4GnNPAAUocp1eF+mUxnuq75aUHlo12OtS5TMmqyfNzrDzuZRMuqMLi54iHZ5R1b8W8XOWVb4Lq8zg4nfmcBwWmufv323QUdDhOC/DI3jCRB1dEUshV5adzyDkSAaISjySLdkRq00TlLGNI46r1Oz+CXCgG8tqUoWI9bZvAtxfnZAIdgnk//S7OKhon/quNEPGXRZvSonpPxw8blodgHLBxHDEjcZ6Nm4I532Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKFJjhJMieY7Bg30lKQJaETUNKQNMttaKz7tKKENKjg=;
 b=CIDbCru77qB/euGVlq0TrllrGpABrH+Q/LHIk4dv+fJ83xK48xhNAZm7VWsedBF7pkig3sx1MyxaDBecvB6D9/gip8OyjlupwB1l7u0/E5fqrgr8tJSlrCeWLcy7d9oozc8QrQGjIdrZT69IXuciKptlrtU7SbpPwBJjG3HHOsRIHT4OWXRfqWnYGtuvDp6Q33HMYYhH1fgl9sc17Bhumt9G6KDUUTbdP58XnPyGycoxq+o7mH63ohhcf8uwQEpTYBpqQh9E5wgbG+vqip0s5gswsmx0Qhu+1D0vMxG9ATrAH5jhfPBu/deEi/28NmvTrYD8eO8LpZ+btOMTCpQqHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asus.com; dmarc=pass action=none header.from=asus.com;
 dkim=pass header.d=asus.com; arc=none
Received: from SEYPR04MB6602.apcprd04.prod.outlook.com (2603:1096:101:c3::10)
 by SI2PR04MB5773.apcprd04.prod.outlook.com (2603:1096:4:1e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 09:22:30 +0000
Received: from SEYPR04MB6602.apcprd04.prod.outlook.com
 ([fe80::62f:224d:5cc:cbdc]) by SEYPR04MB6602.apcprd04.prod.outlook.com
 ([fe80::62f:224d:5cc:cbdc%6]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 09:22:30 +0000
From: =?big5?B?S2VsbHkgSHVuZyiseLnFsvop?= <Kelly_Hung@asus.com>
To: Tom Rini <trini@konsulko.com>, Kelly Hung <ppighouse@gmail.com>
Subject: RE: [PATCH] dts: ast2600: add x4tf dts for asus product
Thread-Topic: [PATCH] dts: ast2600: add x4tf dts for asus product
Thread-Index: AQHaU46GuOp8vpYcm0+oYSbqn5BP37D1OChw
Date: Thu, 1 Feb 2024 09:22:30 +0000
Message-ID: <SEYPR04MB660286EF00E67DF8DDB63F599D432@SEYPR04MB6602.apcprd04.prod.outlook.com>
References: <20240130104045.199879-1-Kelly_Hung@asus.com>
 <20240130150906.GR1152441@bill-the-cat>
In-Reply-To: <20240130150906.GR1152441@bill-the-cat>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR04MB6602:EE_|SI2PR04MB5773:EE_
x-ms-office365-filtering-correlation-id: 346f0cbf-201b-4161-0693-08dc23075087
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kHSTvjNK58zJ7wgPfiJje0FzOTtCd8rqlnKcTDIUvYlTfMC1znA6YpKsgASnYznD2JoVXNQFf4FEiIRDIuU/imww6Zrbi+EA5KOOrQxibMu7C5/tEatjJqBDaG866rQ6qd4Gg8Y0lCFB8c7f4sBji4oG6P/l9efMp9MjlED03kxmfoRDCMmskU54Ehj0IJXLYb/xzgS5MY44ACnL7tMi5/8VUkkUtRR/49QIVjPUndhiRe/qKMhO135gXyeybesEQNEE0aglZqEMnsyKAQ/SxfdUCj1FmybohBDEQ1Ja/1rMU0IWo9kmv08fQ8ldKPzQAdDfMLfzvFH9zdJv2yfiR/WV6BKMyn5JxpGXkdPBAW9oy+gNrunDFMlMNLFmhqxpb8sL0NQvglTJdLgOoQJVOuegVSieWLRjuC7XVj1Bd94qPMOm/zyXJ51YSQjDd9YxppX8a1a3rMXOeYCfE05JkAHoArcQsvxGaLj36671E6rQygDQUdqLVTENXMvmApDsXtFUIKt0q3vUrxQl5Erifv+tzra3I7cT+UKA/mhwf1lbzIzDVSAZcO3xqaczkOURB6YfI+UM++57bHIth250jB/TVw742jmPokNOgtcUEf4S9IgajY4Fwj6TjXOLBeaboBhnw/TqmkBrFdl+fyOt0qEHb4tw0PYthT5FvoyFlYg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR04MB6602.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(54906003)(64756008)(110136005)(66476007)(66946007)(83380400001)(316002)(86362001)(76116006)(478600001)(53546011)(71200400001)(66556008)(66446008)(55236004)(55016003)(38100700002)(6506007)(7696005)(9686003)(4326008)(52536014)(8936002)(26005)(8676002)(122000001)(5660300002)(33656002)(38070700009)(41300700001)(2906002)(85182001)(42413004)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?TnhqWVpFdmdiOEdXeXFCajFEa1VSSFJxQmRtV2lHRUFSS04yVDFNNGQvejdVOENs?=
 =?big5?B?NUJDdFJMNE9EL2dWVEFNZEtsWGZ1VHJJUkFTL0poZGdTUDQwMGtOUjdNbE02RVIw?=
 =?big5?B?YlVqR1JxaUR4UGs4VEplaTRPZmg5ZmhnWFVwS1ExaW5oRDdaNUxFUVJpa3BSK1dK?=
 =?big5?B?M0dpMW5jRnB4ZW1DTlcxNFl1NWpBZFNZZC9DcHh1N29pSzY5V3NsVW9QVDlMN1NB?=
 =?big5?B?YWxqS3ZlS0FaTTRUbDcyOUdwQ2xLRjhIUW9PSjFtbzJGY212VzRWVEFOQytxNTZF?=
 =?big5?B?ZmVNb1Y2S2gveWhwWVNPSVJYN0JRRzRtRTNVanM0ZzBXcExONlJZSTRXS25XMnp2?=
 =?big5?B?NUkwMmRTTGc3V1g5dUxxKzFEOG9VVnMrbERXZk5RbCtGS3Fpb20raktNTUJiMGRz?=
 =?big5?B?NlBUWHk0NzUyVUdPeERHSnFTTDlmSnBqQWNwdk9FY3VoK1B0QXg2TUtEWWNTU3hQ?=
 =?big5?B?cS9YWU5ZaUVESTVSeU1oMFpDZTNkRy9BeGtacEY0R3A4cE1KdFE5NUt1Z1I0VmVo?=
 =?big5?B?RWtqV05EMndmbDk4TGY2TGFYL2dzTU9nS0JsTFJ1eFZqUjF4enpmRnp4OHVhS1pE?=
 =?big5?B?eVgzaFNISjNnRGlPMG93RlZDbWtXRVFJKzNhNGpyV2N2dFliUld0MElmYlVLd29P?=
 =?big5?B?NnY5dXhWQUJlWCtKYmFtNE03Tmk0WGMvMEZzWjlQYkpYZEFDZ2FKQldvSEQwTWx5?=
 =?big5?B?aElVTmtHRE9zTzhnbkpWVjJpQ2MzWFREczA0UXlEUk9tQ090QzJaMHo2a0xGSXpN?=
 =?big5?B?akNUalNGM1FJZW51MUlzRFYvMksyUXZXU2gxeVl6SklIWThRNnZkaXBaVDBPNGJp?=
 =?big5?B?eStrMWc3S2h2cnlNVXcxZy85WnJYRVZCNksybWI3OXNEMkFwdkh4QlltSm40aE1Z?=
 =?big5?B?ZGo2aXJidUVTN2xBV05QeGJFL0prR0I0RmRKZGFkNWxvMmhIYUg2TUtHcDNmdHQw?=
 =?big5?B?SHpuKzQ2VVMrWWUzdGhaMTc3UkZ5QXl4ODluN0VHbzJlUkZzSFJkUmZtbjcxSTZj?=
 =?big5?B?cXQ0QVdrc2ZqaCtYWnlXYS9GejlBbHplNzE4ZjJyVzFHNzl2cHdmNzE4VTBWKzVp?=
 =?big5?B?MTBjRmgxblVTa3JBRXRUQlJlVWJ3N1JwVUpUemhDc1FKSEViZmFGMFJ1V1VTT3J1?=
 =?big5?B?UnY5cFJjcFhCT0xJS0Z2NXFNcWM4aWdaTGhEWXN6RUhnaDdadlJKM1VQYUpXOFRH?=
 =?big5?B?eXZjWlY4MVR3aFJOaTd3T0xWN09ram1vSHBuRFRvd3h3VUc1QlZ6Tm0xdWc2QlFZ?=
 =?big5?B?M2NkWXpqd1NOSGxYajRBODlYUmhxQytycHRjcVpCNE5Ba3I5WGtwTW9meUtTeGlS?=
 =?big5?B?M1hlTXo5dnVzVUNORS9xZmswdXdSSTNTN3I2dXFiWkh1ZU9nV3ZoaHlzMU5ja0V3?=
 =?big5?B?R1B0STRBUjlFNnVRWU5oSVg0WFlwK3d0TXh2d1ZFSTZBMEplcWdXd1Y2emJRVVU4?=
 =?big5?B?ckgxVGExL1h0dUhSdUFDd2RHam1WYkw4b1g3am5RYkY5a1hEaGlxcTVKZUp6ZXJu?=
 =?big5?B?cEJabmJDU1FkZlVtMlluOGhmbWZFQ3VzS1BRcUNSMVhXUmllZ3huSFB3SkFmWHdo?=
 =?big5?B?RE12S25xaitYcU9CbytlUXlMNXFSbHVEbUowTjFGQXN1a3FIemFhU1NISzZDWEN5?=
 =?big5?B?aFVjMlloMkZMWGJGUHd5anpzUjBnL3VJb0NtVjcxNERsa0FNY252SmY5TnFYT2dI?=
 =?big5?B?RHp4VHk0WmIyVEZEbnR1RC9kVkU0blFhOGFYazFjOVlCOGR6VU1wS1hseDNEWWV3?=
 =?big5?B?ek1XVmxNY0N2RUhjdnVMbE9vRjlZZlNVeUxFaUovVm5jMTN1T2plaUZFTndFYjQ1?=
 =?big5?B?ZG9GL0xVVFJBbGtLSmxlUVRVRlRTSU1idjN6SjhRS24yTW1iZmRNNGFNT1c2MzNl?=
 =?big5?B?YThWaDBpd0oyV2wwQXltdUZoWW9RVUVjY1pveGVTVVpWUjYvZmc4MmZ4azNQV01S?=
 =?big5?Q?eBjxiE8Cr6efWTLRtUKI5lNOLOfDjnD0UMQ7OhgGecg=3D?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR04MB6602.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346f0cbf-201b-4161-0693-08dc23075087
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 09:22:30.1963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 301f59c4-c269-4a66-8a8c-f5daab211fa3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1CxEXnoGBYH+ahde135tHOWqQKW0fUj2DHPcqgEseUvDtA17a9FpaaPzJNnSDO6GSHNObkRPrplFfI+OtnPzAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB5773
X-TM-AS-Product-Ver: SMEX-14.0.0.3197-9.1.2019-28156.001
X-TM-AS-Result: No-10--26.592700-5.000000
X-TMASE-MatchedRID: gJaqKlYO+CuvAcrly0si/w9MFGsNTBFU3DpUPat2XBvsXxvZTa7VATvQ
	G0xdFpDCgz5VmKZ8x84nuQloIbSMz8WH6wwdsMksWelk5oubh9KZttcrMQhABb8QmgcrFuyssjK
	XwoAhxb8WEjBjgng7b1C7JNZxGVN2f9REPtrqOGEC8qXUGvXn4TGc4uRvtOeDGmMaVGGwmXpEes
	sN+/WoaNztvqTn5fr3kZ43711UirdTz3YpGWLHrDKT8fDhc32N71Wl7zfB5vh1dilwOXZXnZOU1
	MLNH5QIqd3rLH8qrxeZ82QLu17vbfKx/Ln2xTEuYoGI/iPEgCYo9FEPVb4DMtvIAMT/07OitT4p
	iLWpY7p+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--26.592700-5.000000
X-TMASE-Version: SMEX-14.0.0.3197-9.1.2019-28156.001
X-TM-SNTS-SMTP: 	FFC2560AE5BA82BAC9B6B8DBE61B9DCEC14A5E53F8628B3342123589252FDBEE2000:9
X-OriginatorOrg: ASUS.com
X-Mailman-Approved-At: Fri, 02 Feb 2024 08:23:35 +1100
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
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksIFRvbSwNCg0KPiArICAgICBtb2RlbCA9ICJBU1QyNjAwIEFTVVMiOw0KPiArICAgICBjb21w
YXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLWFzdXMiLCAiYXNwZWVkLGFzdDI2MDAiOw0KDQpJIGRv
IGEgbW9kaWZpY2F0aW9uLCByZXBsYWNlICJhc3VzMjYwMC1ldmIiIHdpdGggImFzdDI2MDAtYXN1
cyIuDQoNCg0KQWxsIG9mIHRoZXNlIGFyZSBib290cGgqIG5vdy4NCg0KQW5kIGlzIHRoZXJlIGVm
Zm9ydCBiZWluZyBtYWRlIHRvIHVwc3RyZWFtIHRoZSBkdHMgZmlsZXMgZm9yIHRoZXNlIHBsYXRm
b3JtcyB0byBMaW51eD8NCg0KWWVzLCBJIGFsc28gZ2l0IHNlbmQtZW1haWwgdG8ga2VybmVsIHJl
bGF0ZWQgcGVyc29ucyB0byBhZGQgYSBhc3VzIGR0cyBpbiBrZXJuZWwgZGV2aWNlIHRyZWUuDQoN
ClRoYW5zIGZvciByZXZpZXcuDQoNCkJlc3QgUmVnYXJkcw0KS2VsbHkNCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5jb20+DQpTZW50
OiBUdWVzZGF5LCBKYW51YXJ5IDMwLCAyMDI0IDExOjA5IFBNDQpUbzogS2VsbHkgSHVuZyA8cHBp
Z2hvdXNlQGdtYWlsLmNvbT4NCkNjOiB1LWJvb3RAbGlzdHMuZGVueC5kZTsgb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnOyBLZWxseSBIdW5nKKx4ucWy+ikgPEtlbGx5X0h1bmdAYXN1cy5jb20+DQpT
dWJqZWN0OiBSZTogW1BBVENIXSBkdHM6IGFzdDI2MDA6IGFkZCB4NHRmIGR0cyBmb3IgYXN1cyBw
cm9kdWN0DQoNCk9uIFR1ZSwgSmFuIDMwLCAyMDI0IGF0IDA2OjQwOjQ1UE0gKzA4MDAsIEtlbGx5
IEh1bmcgd3JvdGU6DQoNCj4gVGhpcyBpbml0aWFsIGRldmljZS10cmVlIHByb3ZpZGVzIHRoZSBu
ZWNlc3NhcnkgY29uZmlndXJhdGlvbiBmb3INCj4gYmFzaWMgQk1DIGZ1bmN0aW9uYWxpdHkgYW5k
IHdvcmsgb24gQVNVUyBYNFRGIHByb2R1Y3Rpb24uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEtlbGx5
IEh1bmcgPEtlbGx5X0h1bmdAYXN1cy5jb20+DQo+IC0tLQ0KPiAgYXJjaC9hcm0vZHRzL01ha2Vm
aWxlICAgICAgICAgfCAgIDMgKy0NCj4gIGFyY2gvYXJtL2R0cy9hc3QyNjAwLXg0dGYuZHRzIHwg
MjM5DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCltzbmlwXQ0KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vZHRzL2FzdDI2MDAteDR0Zi5kdHMNCj4gYi9hcmNoL2FybS9kdHMv
YXN0MjYwMC14NHRmLmR0cyBuZXcgZmlsZSBtb2RlIDEwMDY0NCBpbmRleA0KPiAwMDAwMDAwMC4u
M2M0NzgwNTgNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9hcmNoL2FybS9kdHMvYXN0MjYwMC14
NHRmLmR0cw0KPiBAQCAtMCwwICsxLDIzOSBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjArDQo+ICsvLyBDb3B5cmlnaHQgMjAyMCBJQk0gQ29ycC4NCj4gKy9kdHMtdjEv
Ow0KPiArDQo+ICsjaW5jbHVkZSAiYXN0MjYwMC11LWJvb3QuZHRzaSINCj4gKw0KPiArLyB7DQo+
ICsgICAgIG1vZGVsID0gIkFTVDI2MDAgQVNVUyI7DQo+ICsgICAgIGNvbXBhdGlibGUgPSAiYXNw
ZWVkLGFzdDI2MDAtZXZiIiwgImFzcGVlZCxhc3QyNjAwIjsNCg0KQ29tcGF0aWJsZSBzaG91bGQg
YmUgYm9hcmQgdW5pcXVlLg0KDQo+ICsmdWFydDUgew0KPiArICAgICB1LWJvb3QsZG0tcHJlLXJl
bG9jOw0KDQpBbGwgb2YgdGhlc2UgYXJlIGJvb3RwaCogbm93Lg0KDQpBbmQgaXMgdGhlcmUgZWZm
b3J0IGJlaW5nIG1hZGUgdG8gdXBzdHJlYW0gdGhlIGR0cyBmaWxlcyBmb3IgdGhlc2UgcGxhdGZv
cm1zIHRvIExpbnV4Pw0KDQotLQ0KVG9tDQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KVGhpcyBlbWFpbCBh
bmQgYW55IGF0dGFjaG1lbnRzIHRvIGl0IGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9u
IGFuZCBhcmUgaW50ZW5kZWQgc29sZWx5IGZvciB0aGUgdXNlIG9mIHRoZSBpbmRpdmlkdWFsIHRv
IHdob20gaXQgaXMgYWRkcmVzc2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBp
ZW50IG9yIHJlY2VpdmUgaXQgYWNjaWRlbnRhbGx5LCBwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5
IHRoZSBzZW5kZXIgYnkgZS1tYWlsIGFuZCBkZWxldGUgdGhlIG1lc3NhZ2UgYW5kIGFueSBhdHRh
Y2htZW50cyBmcm9tIHlvdXIgY29tcHV0ZXIgc3lzdGVtLCBhbmQgZGVzdHJveSBhbGwgaGFyZCBj
b3BpZXMuIFBsZWFzZSBiZSBhZHZpc2VkIHRoYXQgYW55IHVuYXV0aG9yaXplZCBkaXNjbG9zdXJl
LCBjb3B5aW5nLCBkaXN0cmlidXRpb24gb3IgYW55IGFjdGlvbiB0YWtlbiBvciBvbWl0dGVkIGlu
IHJlbGlhbmNlIG9uIHRoaXMsIGlzIGlsbGVnYWwgYW5kIHByb2hpYml0ZWQuIEFueSB2aWV3cyBv
ciBvcGluaW9ucyBleHByZXNzZWQgYXJlIHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBk
byBub3QgcmVwcmVzZW50IHRob3NlIG9mIEFTVVNUZUsuDQoNCkZvciBwcmljaW5nIGluZm9ybWF0
aW9uLCBBU1VTIGlzIG9ubHkgZW50aXRsZWQgdG8gc2V0IGEgcmVjb21tZW5kYXRpb24gcmVzYWxl
IHByaWNlLiBBbGwgY3VzdG9tZXJzIGFyZSBmcmVlIHRvIHNldCB0aGVpciBvd24gcHJpY2UgYXMg
dGhleSB3aXNoLg0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg==
