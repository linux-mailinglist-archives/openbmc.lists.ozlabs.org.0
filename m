Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F404B1BD5
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 03:03:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvxjn1wL1z3bc3
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 13:03:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=AHTSAItE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::714;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=AHTSAItE; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvxbz70Zvz3bV9
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:58:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tw/65ACZVXnWurCfcP2qExeDt2NZ+fTzxWT2YQQlk69htOXya7WJcGbMwrcg+1lfT38u9s2EilgebR2lKW83Fro8SEq1h1a39IIzgONjgTfzImBm2/2XtcJtDXBphyMH6JB7eSfyBJbyJHwgMTIMOimtVVcaS8Xu/4ZqvcLa6jZ+RxOVD4pYD/9cp8f4f8h267vIqIW6ZqqHXKLKUWzuTzyQe1xe8wPQv0ttBnoFz5zgQDhtHt3btBPezFiG0lT1dpBc86+g3MXCBmwFJD8FWFPvhBHJLCs5umh0z8aZMFuqXYbh8l+ZH6pxl2LPUo4n8gOdPQ5iVntc4U0mg8YTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpAZh1T7C+POkdbs/YT2d/ls+QvRhT3Kw33SEe6rvw4=;
 b=HEEtWvHRhvc3wVyR9eCJSQmgHw99iYMdTJDfbm0mCEQze5E1X+VVccZ3HaGCgNp9jAi6rjLjAu5LMNWPlGQVV1KWlBk0LmhAuUg497THu2j+x/A53Q+wgZDVRqTwIl+hRU2t8XGm80yYVdoW7A8q5N5HA8f35SQFt6lUyBAPqUcCchiyn3G5B9Wt/t7wWLZR5yYGhokTYCtj3P+gwKsivaEkOrXOAT+UAkhs9u4+OLEVMomofuJ1uUq61BUaBSP3XxoQa7bO6I1QpPjNv2E3ZIlik+i1NcaYapbD1VybiHQWwIzeDt8xftcYlxRTMnq5BiZw9thLll5l5ilynDeQZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpAZh1T7C+POkdbs/YT2d/ls+QvRhT3Kw33SEe6rvw4=;
 b=AHTSAItE55JWfkBOGBDXbcucp3AzDb5TADfxyIE3FbtR0thhvBS6MIhz1TjfYxxho7tjJncBqOjwaW8leB/rTRan5AsDAid4nvT1AfOAwLEE6tgmOPJ0cQJ4G51SlLOu/Y7NywbFOa1xxWKvKyr4+psyabIBt9M+whBLOIUq4EU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB4015.apcprd04.prod.outlook.com (2603:1096:404:8005::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 01:58:16 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 01:58:16 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 07/10] arch: arm: dts: bletchley: add
 shunt-resistor for ADM1278
Date: Fri, 11 Feb 2022 09:57:52 +0800
Message-Id: <20220211015755.27644-8-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211015755.27644-1-potin.lai@quantatw.com>
References: <20220211015755.27644-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abb3b760-edce-4046-24c9-08d9ed01f70c
X-MS-TrafficTypeDiagnostic: TY2PR04MB4015:EE_
X-Microsoft-Antispam-PRVS: <TY2PR04MB401570D22229536FD12759698E309@TY2PR04MB4015.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XsCUdWwz47Suc/u3hfm37VNoYn2gT8CYGZtTl6S5NCOR4lfO6XlP9qYZxqwbvx30117vdHRzwxAJYiGIeUqfDet1/diyYZLhxsMXgwsNjIpunjHuPJ9bknNSvMutbNPCDyUj3jSuBp7VcdkOyWfgOzEd5XCAUlKyl4M4PF6PWqRYJMmODvXheNl2oOGhxTToKTYaxmSoPI/mdw3r4JnmDQC1ViwG4R/ZdzBAfudVJy2kolIRW/R/CI3FZEXJWjheTb5CM+SIz8S7OmeWDNsMz9XAhJMCdE4YRNsthSmyjfDDGkvoAz0UOZZmgcWiO7/Joitq5uT5Z3LNPf2imPzlnvM9xiwEfF+A8epTiYnRiPtNfLZBXqraI/FITZWCnnA/lsy2sjCdYuNzc6AKiOjCSc91JoKDTo4PZhH3JPEYX7z5vfgnsd1/upVgdTpvydBF7O7qqmCzd/bTU7nzvuCptX4HAI/PtRPb983nnfRk+PLTLpHgvtDbZp4cwxHoMLzQTYaoMGnGZ1ydFMh5S+3toG/zD7K8STrDS8o69Mt12mFETN1shJVAM1vuqxdswm+8Wkmnu4J/G8BtQ4qZoxawTIJSNYpg5kRTGNg40fRwYM7tmuUmaMwFG9hOMF+/DhKKKFJplf2HgjpCLYmk5Jmi5XkaURrEhLcsIZV7O2i3X7uu7AhoKXRFWUyfQhdFFpg5lxvTYOHarO323FqTnQDd+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(52116002)(66556008)(4326008)(66476007)(6666004)(6512007)(38350700002)(8676002)(8936002)(38100700002)(5660300002)(6506007)(316002)(508600001)(86362001)(6486002)(1076003)(186003)(26005)(4744005)(44832011)(2906002)(107886003)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o30pjZCeeZhApDv2U9ocSbbpfcB7gcPQPk3oW1E/Rs0VUEDnDzW+ELeYzFxw?=
 =?us-ascii?Q?0GBEkCypSkucWQU6pv3ZTFRv2+NmUMWypCY3mkujpfL2i+fpZd2hf4g6JrBj?=
 =?us-ascii?Q?VSZwn6XvHCNfY+IDfHBESAX0D01BBPGA45Vemhyp3DimKwHUm4/kQ1j35T+0?=
 =?us-ascii?Q?Eg0DK88tg7k9WPFA4NC/EPGwHUUx428ZXBWWOQqeVP0KhI9eueMelzO+lOvu?=
 =?us-ascii?Q?aiTbw6Enl0mUtnFPkV+0AqgYnUYsiD+O6yMphKTb6VuPMBD7bHUGBzPzWy2R?=
 =?us-ascii?Q?eIK+EQDo/ubUln2gDWAJ9c9ZTHKV7XZxLq0rOPOQ/iuBUBGfrJkr7Srh0nZB?=
 =?us-ascii?Q?Gqo9tJxrs92cjKptR0UM8cVgXFYNCuythp2Sgl1uSfrqDFuSnyGYqncAfLRi?=
 =?us-ascii?Q?G9r/jWOuHRaMGMREuGdx2vMK3GOFDkFMo3G0hzCgbbnHG8z3L2+uwCtPgwe9?=
 =?us-ascii?Q?SY/3xluMZsL14IR3dXneB7BhJtzLE4t6codj9NQUKcI5EFiPmyqrvW3UonrT?=
 =?us-ascii?Q?EWY6+29c4Na7CKpn9V46skAueMGnznG4fUCHnBLTh+dv1YkutCFXxDcAM03o?=
 =?us-ascii?Q?wuc1gzeFtHbtHdRDlCLdBLDNbUry5z8GG2DGg03Eiw3ZsR6deTw6YBzW6+VT?=
 =?us-ascii?Q?kcjvW3vUUjGNFd7cvuSbgfhVNyoOp37GaIas790n+AvkAnOgIc7N0ezy1XNx?=
 =?us-ascii?Q?7VWiiac7G8PVYWG1RGaNZ61MABxKYRv59dxawfdChkP2egOC1i7Gua/4A762?=
 =?us-ascii?Q?KZeLyJzKIreuZ8JS2s0aeH4kM4/nOVNI2Ap+9p3NTNJU1SS3yb713B5GwEy6?=
 =?us-ascii?Q?orGWhAT4Nu1nqv40W3YKCqcjdCNYxC5SNRdkRQfc8eeZHcVR7AcMOQBlWHBg?=
 =?us-ascii?Q?R9s+u89PzqrJ4rdLAabep1rP/pVaRDHLg3EeDMuZGCd1PvO82PHB5f6xAjKq?=
 =?us-ascii?Q?jiVckd+RCq7aUK84rreKOJvPK8dWj+7pVnRufuquqZwYJ+EAVoZ1UsImqHkQ?=
 =?us-ascii?Q?K6xIKWvGVaQcFhLf97oEnX+75QNKqiKAAXpCXFRvK/bloVvRaDoB7zjGSTVN?=
 =?us-ascii?Q?VTOC9msFkXIMOWFIeJXnSGXn94FEbpsD7L6u/jET91RokA0mscH3fap8pJIO?=
 =?us-ascii?Q?rUWarMpHPE8alZrEHjVayrgPhhGUR5YC7L8qupFTYp2h+AASSsRxTpPshdzV?=
 =?us-ascii?Q?GKIEqYlMn+TJXCtkk0ZTubyHID2ntwhe+fp8nfR/Y/u7iSgm12ExdoIFchmj?=
 =?us-ascii?Q?EUzregXV5KyoAqSxkP5ROTLUcr+fimoDE1gtBXf1ycg9bXv1Wa6YJLrKhKpZ?=
 =?us-ascii?Q?eu0WrE4RuJK3hgiIemyDeaGpt6FrNUZPGUrwzeKV3VWrdRc87+ZckKkJp8r7?=
 =?us-ascii?Q?uWSu0QwKVCfcU+A8CGZ5gwhF45o9m8Ih/wpngyOOaqdFWQ/DZKfB3/S/QuXQ?=
 =?us-ascii?Q?kQZ030sog2TS4qr32llw/eJi0SWnFHqb6c2BdP6DhOV8SkjTxW7wZA1yzvoJ?=
 =?us-ascii?Q?u6+V8EXKrYp1X/uHdk68SQuXTsipW2OJse0xUUsSbvs3889dp8hfiMDMtDh7?=
 =?us-ascii?Q?S+IjUZ3b3zltWhDk3ak6qQwW89HkhkPhgq431k32O9DqSgl4TKLWTZOaM0pJ?=
 =?us-ascii?Q?zON1BGeWB63KcaZeXtgj5PU=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb3b760-edce-4046-24c9-08d9ed01f70c
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 01:58:14.6404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbbm9o4jxMgFFp/MYhizf0XusXK9iy3v8MR492ahrJ37wTuH/EV2RhP5kfA0HFXoLH6kJsQa38pkGj18popxRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB4015
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
Cc: Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

fix with correct shunt-resistor value base on EVT HW

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 8afaa8f52c38..76c086ea7b71 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -715,6 +715,7 @@
 	adm1278@11 {
 		compatible = "adi,adm1278";
 		reg = <0x11>;
+		shunt-resistor-micro-ohms = <300>;
 	};
 
 	tmp421@4c {
-- 
2.17.1

