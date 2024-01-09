Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C29827C9A
	for <lists+openbmc@lfdr.de>; Tue,  9 Jan 2024 02:46:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YdQIhYiK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8DKh6RQkz30fF
	for <lists+openbmc@lfdr.de>; Tue,  9 Jan 2024 12:46:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YdQIhYiK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8DK357XVz2xYk
	for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2024 12:45:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaL2tyDbC+XNLB50/yaljJi52qk9tTZTZQD0pAaMXhRwA2TcH84u/J5Slc5FUKRCHvJwBpUc4/5zuBTvlGTDaLMzJsujkB6pqPwx+6lmkHoiPpqRVI8qZ7fmEW2JiCEKKGaI3aHc9pvy5GP4QXm4xEj9qyzobiHbFfYe0SRnOrSzVWpI+r+rWy7Ew+j6UJyB4ffooWiP8vPKIpfwqvnT5rbq7hNVoM/QBs4MuS4ENxO+obDBUpEHbHtRlc+KYwaXNzyakt6ijlfmuur92O7lJg8xsUA+c7UlR+bmbcZyeuV1hUv9w18cXsIiiqnjg2Phbwr6a5hx3soAss3FEoNDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTa/F1y5mtmNFvi2WBPVnydw3XXJNan2+E5P6krx/ko=;
 b=HQa7qSM6mjSB/3hv0t4jRONiYX/RrJ1mJNTPbWGFa4MJ/Qhci29cL+Wjbsg5vKBfeVId9i9Fa2iZN+KoHwKBRXJM2t3cJzIxXIQGpI8qaiv67m+A4+Dq75xmbvPEsaGEQuCZkjWA9UwQCTwI5LGwTVqVhzjKVoKUVphvX5H2hAyahewY+7qhWApeBBlPFIvzaFXnuAmYj+bGjDCQx8uM2y/sY3Bj/C19UvoXWnzqNApPK5EFJU0gx6h45HmRuSN3Ci5LMvuJEd/PLfQC+2Iof/6ohkn/UWnfzjHjP/hgqQzEHISNzCQruPKut1srQSbF5844XHU30iL+XN2QLnos/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTa/F1y5mtmNFvi2WBPVnydw3XXJNan2+E5P6krx/ko=;
 b=YdQIhYiK2+GAg4hiAxIuYHPO/XMTtNfyo/dHilLCdrIVPC0aIW+rvP03rDjj3h3yIs5exnOhK9by+i96qs/JNHFBhSCMX1VKyI6p5RRDpxZqaRfdbHrRC9mhxQxF4t6/tUD3/xR0zQhYxG/tS5u5gnzaMHqbHGaR2oTMBaqA9KGOR+TjA25BY10urlGwfiCdtGJjMCh+haHesKogrjGaw88x8PZ/IUrBIjvyZCSgbDQAKb34S+mdsSXAqcG2NWHgjX2uF7qBoNKOGp9QPmLA1FOi9SXHiDdtx/34T1jyf8xDTmnQSQIyZSPOyI2Uc2YnDu0KQEsaKnLVwxzBSVS7oQ==
Received: from TYZPR04MB5853.apcprd04.prod.outlook.com (2603:1096:400:1f3::5)
 by TYZPR04MB4144.apcprd04.prod.outlook.com (2603:1096:400:2d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 01:45:01 +0000
Received: from TYZPR04MB5853.apcprd04.prod.outlook.com
 ([fe80::c1b2:ed02:72da:2acc]) by TYZPR04MB5853.apcprd04.prod.outlook.com
 ([fe80::c1b2:ed02:72da:2acc%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 01:45:01 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: "joel@jms.id.au" <joel@jms.id.au>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: Question about openBMC U-boot upgrade
Thread-Topic: Question about openBMC U-boot upgrade
Thread-Index: AdpCnSVlJvaVpuukSFyGtRf9EMncEA==
Date: Tue, 9 Jan 2024 01:45:01 +0000
Message-ID:  <TYZPR04MB58534AB3D2D8245EDBCE8AE4D66A2@TYZPR04MB5853.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR04MB5853:EE_|TYZPR04MB4144:EE_
x-ms-office365-filtering-correlation-id: 1998af35-3ab4-40b5-12c2-08dc10b49873
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  OKXviCu+u0Yvk/iSO+bryu5Cv7snYMqbnPbKMYpBaB/+mpg1iEaA3FZkw3rvj8XtrTEn7jza6UitTs94MC9O2Mzl272LpTypeoJNoE5FO9DoQVaI8zcuUz5OkPk+0M4ICF8o0nxir5zYYoDhs+Bs+7+89rpi4sgsb4D91PESTbeEFdxmizkQRNdl1OQOvo6jonKv0n5vIeD1HNwQXXoLyZ+3FS0TxJEGEJjrMOfm0JIKcfI8nRO30Ynuie89YBWRsi6qIvt0ke4gP86W4BtB0FpLgo0S+VYIKS+ygSGbFs44hkc80J2cx5lSjKEyBneqJWa5tTg0sb/+FZPGMnApfsWzf/tv4fotkoXlj5toWRD/FsCqFwJXeO6YqXSzo5WoHEK4cFwNd/xVHKw1+qrQSkvQZzmMyJdLlueXYje1NMcW+vcFL4EckcuWKfRWou/eGvgeotpyJBNZYTCFxk1i0+FzwSw/HSRGg47ZL5cco9ccZrRoTjoGrpuYWC0M32xmx2Qf6waGYdnRQUtL5Pinlv2wVaolz23ZL7hvQppOsyywcLDoBiw97TUTd/Yp7D0BoTA+ZhKmOOaCMl/0U7CAFU4B719JtgSxvpkUwNhxx5Y=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR04MB5853.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39850400004)(396003)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(9686003)(26005)(966005)(7696005)(71200400001)(6506007)(478600001)(83380400001)(64756008)(38070700009)(107886003)(2906002)(4744005)(41300700001)(76116006)(66556008)(66476007)(54906003)(66446008)(66946007)(316002)(110136005)(8936002)(8676002)(4326008)(52536014)(5660300002)(38100700002)(122000001)(33656002)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?JwcVhdHrZgbo8/XL4VGpGt7iE98rLYRuL1vKRulBpUrej0heAgyjVQj82+C7?=
 =?us-ascii?Q?c9r7M3iuAxv9qrY9TKeHL80KJICXuIxgTAoXqy0Z31u6mDB930nDrPpS3ZlV?=
 =?us-ascii?Q?PM3prch4Tkl6Io3otYSHD9xGIZbFgfoNAjFvFLzVRVchW8f72qfqvFN1FjUY?=
 =?us-ascii?Q?37sQdQn5DYW0wd2fbUHktm8GezQ3RduqzD9E5ZmB63EJr1xk/Dw/tYXXWYnb?=
 =?us-ascii?Q?O/TPtmv6QMhESgzvKCCiM/3OWNomxNSHY7JvUSgj0ISaqUY+4MpCiGAyBnmL?=
 =?us-ascii?Q?blmmYvH2VvPHzCvTt3NrN3LtmpRjjhcLt1YoHCbjYTIy/o6SB+OXFz6CVm8N?=
 =?us-ascii?Q?VgwtVlnYAjYhWNFQzPO8sPjc6+681SMhci/IPWkzlPJXShq6ozLiD0H2L/16?=
 =?us-ascii?Q?P2ydGBCSgJQNsZYv21t9JJMkzukc0+OVp7s7C8C2e7+xqrXXf/1cWzFtFMXA?=
 =?us-ascii?Q?pTksg9tRQeJDW4s8+2/kJw8MElCezA8QCqrgeNvpr2iQQM33AW+YTUSbWM2x?=
 =?us-ascii?Q?9Dnz+FeQ/uFIH3K4a+zY9y4lZZ/bR9sGWKQwjN+2XiVjVhx+1DrVS+PoDpwR?=
 =?us-ascii?Q?lIt1hbGVue2Kc61E2hiDHNW175NwYNfKDtW7FmlMeThMfAHJB5htpSl6VGkU?=
 =?us-ascii?Q?T2UrM+wsA9uc0fgYh6z+zueAl0yw0Z5lgloxQPMTvr7FE3/uvAzFgqqmhVaE?=
 =?us-ascii?Q?Qo2ZUD5RjEcHDiikX/tbXrr5AqhzyXLSR41uIz8ygoNDGjy/q7bb0FqvQXyt?=
 =?us-ascii?Q?roa3016kEVMaesXeoGAs4qhmbbDlU7mVKPaXgsxg4FLwRi3h8RVqf+Ng12Zk?=
 =?us-ascii?Q?RDumQYUe81ofotcgfmSMNcejZojkPFOkQB7hhuZh6IeCWTvIXNpkIdx+3Lq9?=
 =?us-ascii?Q?dqo26eG2wse11MzeTTXQHmFw7gMWiGdxEqP/mYARNttFe0caW3r2272eB1rV?=
 =?us-ascii?Q?5sQEYF0lN1ox4E3y9EaKzwInpGFA6vaads0vyYN6TIoq5H121aQbXqAVkNbn?=
 =?us-ascii?Q?8MPCO6mR6LeGWl19pUdhsxzZnzZXB5UkXdseyWZj0k75ujTVxuIsea3bkFV8?=
 =?us-ascii?Q?3b0H/GNGtP3VvR6YiBMMhO1flZ7nGg7LkCY8YVJ7fvmrb1O154F4JIK8J/ck?=
 =?us-ascii?Q?wQqwH8spDSFzUytTppgALfCsyFNaarJg+SDM7y95JIMoppcvR4WXXeR4X7Ay?=
 =?us-ascii?Q?axrs5R0R7ytBgPOh3PdPsjjDVmeAykpDkS5z6RYV3q5PDXOZZwtFSO/EvjhJ?=
 =?us-ascii?Q?vInd9UZhQKQLvcJ59yNEf9rmpNdVbwfLm0QqosrLoeI1f5Y24EcE7jSUdB9K?=
 =?us-ascii?Q?N27D2U+qywujM7POC25H0trx7iXaUjabslJihyqgEEiLorSA+amsvlgOmKjR?=
 =?us-ascii?Q?WHRt0DklTNrnfNWj28otgg3srJOy0dOsKBifGU9UFcxGVQnwuKRGvxHXgUeL?=
 =?us-ascii?Q?ls/3ZvqJfuMX+fzYm5Y80xgpJFWq3isQsb31Z9LwJ+wbRrGuYlvdlgXSejXi?=
 =?us-ascii?Q?IVtkuhUbNm2+7UGm9oZZMNe9eX96BdzD630FNAC/6nCtevDb3iehDoaF91It?=
 =?us-ascii?Q?6QhwEzUFjHiSoeOvARDoLNsNbRzioAnMKZ95xdbG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB5853.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1998af35-3ab4-40b5-12c2-08dc10b49873
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 01:45:01.7561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jTUIkwRYSsf/KXoAmoo0G0tMcj7ph9yb7CkPQgnn4nI5i9gD/HORvWvbzZkve2fF4w4GeX7Bfe/RxTqbnBVF9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4144
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
Cc: openbmc_compute <openbmc_compute@meta.com>, Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,
We are trying to enable soft SPI driver for BMC to send TPM2 in U-boot.
Upon further investigation, we realized that the configuration for the TPM =
SPI driver in the current U-boot is not set correctly.
But we need the newer version of U-boot to enable it.

The commit we need is
tpm: Use the new API on tpm2 spi driver
https://github.com/u-boot/u-boot/commit/a5c30c26b28c601a7451ac93b5c5b16c047=
2d89d

We prefer upgrading the u-boot version specifically for the TPM SPI require=
ments. Is there any U-Boot upgrade in the near future?

Thanks,
Wiwynn BMC team
