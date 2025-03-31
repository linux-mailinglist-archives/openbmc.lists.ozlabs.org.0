Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F07A76C7C
	for <lists+openbmc@lfdr.de>; Mon, 31 Mar 2025 19:19:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRHtd2YxVz3by8
	for <lists+openbmc@lfdr.de>; Tue,  1 Apr 2025 04:19:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::60b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743441573;
	cv=pass; b=AmLLGV1iJVighpydOL9qOH6e3Zi3vcg2rOWOlUrXUlqrWxHYaajwgbR0kVAr0rTL8bQ8j/jivwFGhYSZIu4rgpDGLbfh2szKIw/bMJM//Thar0B4/0qcdOscsnYf4HEvu/9Z+L3ZHvS7vo2gLAh1+8rKINy/5QDSaNyw4YApQDOmi5LHZ0ysgZltdaCwCaCp5w0UR0kvk1YJ3jeTeXhVtgpnzyU4f5Vg06lxZeArtprWheihD3jXGX9TO3Dr0G0WDPmnuu2+HSWMXpJEheMIftfBMBvcDCt2TV29sc2gVGtuhhVRZf47xg6eBlatjiAMDPzG2Na/kvQ3Z44ftGSXQw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743441573; c=relaxed/relaxed;
	bh=msdUo3wzjzr8XFwzKi5515/1w+Y5mSvWR+VVIcgmn0c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ArTpazzSctJy1UA9xXNZwa3TfcJ6Oc8n3O3IDgzX5+BOvat6UYrLvsgHCf7KzAH07Lvm9KBt3w4srQus75pbdiUqlwuRmZQtbaiiR244EGT9SqUkPD1MSXuaMKdIRIr/BWvxJsqBM2QtxtIN9YxKqFtJSKoMV4hkVEKIIBRl7mbomWzTjXDZ7rv39pJIJm4InvXNFJ9SbO1IQykBz6K0OUk5fn8S8ypVFB/vD+/by/X1W4zjuknSVHBwJXIc4k0Z9gn5cfvI0JcFaIzh05x49NAzoawOSuytrgfMi2XLhjCnMb5m5zXTd5Da1eMOhYU8FhsN5qNi2+I3tbdDIITZew==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RIw6FQJn; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::60b; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RIw6FQJn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2414::60b; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::60b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRHtW5hmJz2yT0;
	Tue,  1 Apr 2025 04:19:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC6rujEphLfkWjWp5stVloInzCPDtNthiqkRbI0FjWSb9xX1iW5hZGT62gtzBv1INfFYfZHk4LyzmxxyUlG/ldHOPFSUwIhzCQ9a6EcPS1wDFecoY/g3rVorp6VDKKgBD8d+qEnkpslZYJP8xckf5EZ0DwfR5m+usU2xcb3GxmGqSvVKm1JVpI1DrqgWvp2s4w5lErQxZaMEAO2i9SYDRoKND5+bo9htanW/ux1dn8GmIXIl+6RQcxnGeeTIgKN01aLqNez8Fs3/7s36SuhL0kp7yZQC+V+25elx3qWqL2rJ9qne9lvO2BGRkn5TnLm0AU3jHtt+Qx6y6pLJyVteBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msdUo3wzjzr8XFwzKi5515/1w+Y5mSvWR+VVIcgmn0c=;
 b=s4G5KRdUh2LGGhO131M9xhln4H5FFnFQrzRtDbxkM1JVFf8nA5S8Mb28J4f3Phw9TK1BkysGcbiu2ZfdonyESX2ktPRA/LhMRl7KNFXtF65YmSsjz5n/nh3YMI3D/+Sq4yUbmXt+MSypPxmY93p5HFg1Id3cGlbvLhnwhugmYJ5ZXPU9A+Vl58uiByNtZbrenO4tzN3FaJxBZWktfR7e43JiIHsBd0E2YhbzgE0EM2MofXvPa4pd7v8vJWmGgxJJSHhjlOmeU+eXCsYM2zSE5zFpMV/wMw8aelQqTZ9lFoPO0Uqu+0Av0GmT1mYy/idetJyQBnrEQ8vnEPA/tcRNzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msdUo3wzjzr8XFwzKi5515/1w+Y5mSvWR+VVIcgmn0c=;
 b=RIw6FQJn1u2Fs7E1lIvDYyFu9xwVDJE0/gYyQr2uc+9sbph0yfUH7ygsnDPVx4sW82lKsZWFXRtCjN0Z/CWOwn25qJm44iJM6ncIXRAPCuz9Llbwq+UjTOQiUAOzV/oZ62p2TFMxKbXaVuMiX96yzuTmpjcshd/AQNf+72wRTqG0tux2daL1JYfSnO0VyC5j7cKErYbpVzesaaiwKX5SbD9PfSx76ig/kraceH08Pw9Fz4l9s2Y/rH7xRjYEB0EhKsPouEVjSG/C21PGm/XXAdie6YRmj1u/WWaF2apyoZCjdMByhJapr1pFc+RuXwHlrUoVZy6ZHJahXXjzm/7FIQ==
Received: from CH0PR13CA0046.namprd13.prod.outlook.com (2603:10b6:610:b2::21)
 by SJ2PR12MB8036.namprd12.prod.outlook.com (2603:10b6:a03:4c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Mon, 31 Mar
 2025 17:19:07 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::81) by CH0PR13CA0046.outlook.office365.com
 (2603:10b6:610:b2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.26 via Frontend Transport; Mon,
 31 Mar 2025 17:19:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Mon, 31 Mar 2025 17:19:05 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 31 Mar
 2025 10:18:58 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 31 Mar
 2025 10:18:58 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 31 Mar 2025 10:18:57 -0700
From: Willie Thai <wthai@nvidia.com>
To: <andrew@codeconstruct.com.au>
Subject: Re: Re: [PATCH v4 2/3] dt-bindings: pinctrl: aspeed,ast2600-pinctrl
Date: Mon, 31 Mar 2025 17:18:57 +0000
Message-ID: <20250331171857.262649-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d0f7003c22e19c8fc7617610043edc7be925a180.camel@codeconstruct.com.au>
References: <d0f7003c22e19c8fc7617610043edc7be925a180.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|SJ2PR12MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: d2824fea-25dd-4a5b-ca71-08dd707823e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?69GcHvvXw0bhH6IMfhhzrtqSF/fk50FFXR9doWMGF9yDG3qnM5uK742E5GUQ?=
 =?us-ascii?Q?ZGV65vcOBU/gXLEb3OAdNrBj6QF1zPmiCE5Uok9Q/2UB8OKZyH+10qqaJxNd?=
 =?us-ascii?Q?jMKSlnk/qEipOh/Nw7Edfi8AeBnyz4bFtqqYDeTA49oJAH79X/ZF9XELIkte?=
 =?us-ascii?Q?pHFllSv10b/f3S1xfQ23MDji7z6vjRL3HLey++q4m6bY5dbYM0SpesRvG6vD?=
 =?us-ascii?Q?StD0jvRO/pmtVDphF+rqiy/ISuIoE0e2ylKiyUs+sa7HnHg4saDYOm+OD38Z?=
 =?us-ascii?Q?jidakGUmUer96BXEwzjam/KV38gW3Jep8dFcZiv3toq1HXv9zYCB8AMiovXa?=
 =?us-ascii?Q?3rsn8qTM5CArjBFE7nzPvixIrCrOOz1Vr+1+9j16WuTfh6lpAxzbUc46Fkuj?=
 =?us-ascii?Q?6EQiiiF4YlYV0KkbDczmw+NKmvVWRwtJHqB4QGf0bEchqe+c1D2waLPvErm+?=
 =?us-ascii?Q?A+WIh+96RvjqdebJEWehzxaj6KTqC5nAGqBK02mbTdYuttEM9MgloPt4U4uf?=
 =?us-ascii?Q?8UXtVjabFigpg4pFv1nmBQC3kTPq7Uw+Jey8lLHTht93XTiTzUidw559KYNV?=
 =?us-ascii?Q?VXnzMjZCMpCWS5q5Z5iGBsfPSsK3sC0K4OmVYqkKjuYVDvjcEWfPDlpgWoGv?=
 =?us-ascii?Q?l69xQI7C6fDpCkiza0xixJxVpDfL62RA1Hlf+KFBIZJELMwmQi7Kzeh8pA+d?=
 =?us-ascii?Q?0WFaRjsjiEsJl4drbLgvbVffhrmq+7f3WYbruZrjskkC6Xan3ShO9lJIdpCm?=
 =?us-ascii?Q?Y4hEVaVtf73dQM6Ibbpo3lf+SoBCEZhrmT0sZKJ8B6ydMhqgx1GN9xt1bHAA?=
 =?us-ascii?Q?QasiZ3D+zXYcUolc5p7LSlgiZxq/Ko+jzQGGhbnhkZ8OReAJ7ytfEwnMXLdS?=
 =?us-ascii?Q?iTPI1aCXZ7sSRf0kF4KTjmOELok9LWI8yGqxlqhU0/O/EFV+iEPfLNuBGX72?=
 =?us-ascii?Q?jC5p29lEJf1vdl7F4qsurwdWMw0kZMFP8IfhayQiJjtcHZdiyan9/JgGWkGh?=
 =?us-ascii?Q?iOc/8/0gKKnOhmbve75c+cxPm4HZsF0ZFvLJfkBDqJDPRUXaxXuAfU5bomZG?=
 =?us-ascii?Q?gIs34tkS+EUhGmPGIJbCODf0RR6Rm9WSp7J/F+P2ZExQH3uCIaC+l4rV2ccc?=
 =?us-ascii?Q?V7QGjGQ/Ypnn+A2H4TQl9/t5sneLY8VGk31E5B3O9Jvo+SuFBUXOcJIATeDA?=
 =?us-ascii?Q?xzbivS58fCAfShaF/9KoBfr42+SrHFaDWNZfZrP1jda7ApTWVaUFsHhFdr30?=
 =?us-ascii?Q?qTZSb3xX/SQSvIKLVLcoXvsqfHt99Y+qqsSTs9LmZQuZLrtFQ8gyz7H9vHED?=
 =?us-ascii?Q?zOWf7POx9rQO6a2gxINUCPuKg+RH38jpDYrcvkuQQEuD0H2ratzD2txSeEJK?=
 =?us-ascii?Q?1JzCHdyV8SENYPSXXaOtr4PwlbLzC8/iINhJaqwxp+5qlNA9P5waSREUwxnN?=
 =?us-ascii?Q?pt1NEeezXfwmQddel4G2d1fTPskRj0ONhoWdq8ppgot1YQAXjEFYdMUK0gS7?=
 =?us-ascii?Q?RTTfetdPMPAMe//iab58wFdywqgwQUI5aGOB?=
X-Forefront-Antispam-Report: 	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 17:19:05.5226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2824fea-25dd-4a5b-ca71-08dd707823e7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8036
X-Spam-Status: No, score=-1.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: wthai@nvidia.com, devicetree@vger.kernel.org, conor+dt@kernel.org, tingkaic@nvidia.com, harrys@nvidia.com, linux-aspeed@lists.ozlabs.org, robh@kernel.org, kees@kernel.org, openbmc@lists.ozlabs.org, leohu@nvidia.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, tony.luck@intel.com, joel@jms.id.au, dkodihalli@nvidia.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>> Add EMMCG5 enum to compatible list of pinctrl binding for emmc
>> enabling.
>> 
>> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
>> Signed-off-by: Willie Thai <wthai@nvidia.com>
>> ---
>>  .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml      | 1
>> +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git
>> a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-
>> pinctrl.yaml
>> b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-
>> pinctrl.yaml
>> index 80974c46f3ef..cb75e979f5e0 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-
>> pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-
>> pinctrl.yaml
>> @@ -276,6 +276,7 @@ additionalProperties:
>>          - BMCINT
>>          - EMMCG1
>>          - EMMCG4
>> +        - EMMCG5
> 
> What pin configuration does this correspond to for the eMMC controller?
> These groups aren't arbitrary, they correspond to the 1, 4 and 8-bit
> bus modes.
> 
> You may have added this squash a warning, but I suspect the pinctrl
> configuration in your devicetree is incorrect.
> 
> Andrew
> 

Thanks for your feedback !
We want to exclude AC5 pin in the default EMMCG4 pin group, because that pin is used for other purpose.
We define a new group called EMMCG5 as:
GROUP_DECL(EMMCG5, AB4, AA4, AC4, AA5, Y5, AB5, AB6)
The bus mode is still 4-bit mode.
Could you please advise if we can use the name "EMMCG5" ?

>>          - EMMCG8
>>          - ESPI
