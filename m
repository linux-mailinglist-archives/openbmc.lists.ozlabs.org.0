Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B2E3C4147
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 04:42:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNSjg0WDJz3002
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 12:42:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=vM1MEpXM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.100;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=hieuh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=vM1MEpXM; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2100.outbound.protection.outlook.com [40.107.93.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGHN20W8Gz2yL5
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jul 2021 11:21:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6q/POH06vgTbWrGeFV7g9VA1gZ/k7VJpOh/VrWZDQG+6xwAd9waTYwNfJ7HjWcIYcWR7YLvH3WLcj5cEKdhhvqNqoBm56LNeefsCAi97YSKpgy7F/KTwBA0M+aXlXDp/Epb/TKdsBelkWDYVo4h/yo5tVzQEZRJ5ZXQvlsTe1d9NGqHjMTzo/7rQT/AGLgDiuGK07wfqgCRVspStpMMtMdWXVVkIaDkUVazJrq0c/fivUOplpl5are3lF27iee11NgKNRaJriV1W+H4vk4/6Q/KwWjtJZCgHVL76GK/AB+1M4j54RKBTB64qFITRsD1pYoGroiqcrcb1zMW6yxm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1kkYplRaP1gqjMOjG9x8WE5ceO93vyKDvftoj27Lnk=;
 b=NU2o1VneLs9Ad046H52a864c3f4CLWpYP6PNsDpN0dI4pR0PP4Dp6Qz7/wFna8z2nwiOckijCR1yi2k6vKbNxcAwwT9/xUyB2d4oyQU10KPW9Q2U3vBJJ84CWwULsBbeG2f7dtgdHVljxzYG1J8gkfbkaYezK8+qeU6cwfwlSKLIr1BZ1dYVL24s22Ok5q7Wbs9EqLefw3qcR80uzedkXlhvtu/9T7j63yIxFkMydX7ZveN5SsH0hn7vQo23RhrIH8eA3GR4Bwrf+iW0ww0TpVDdflryZCi6HWP+Y7nee/MWzTO2+j2x+cIAa3PQcKVwksLoi9+WlgSlFPIyD7rZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1kkYplRaP1gqjMOjG9x8WE5ceO93vyKDvftoj27Lnk=;
 b=vM1MEpXMUFsIgEEkOFhZmFS0egsiqhi6XCzVIwLUu1jRfQjXG6ftVhbEaHkFKNiLX5hXJmZbsQDhSTifsG6LYWK1qAkpKhYqq1XF0BtbzpSGv7D4PtsXPKAiZGefO+LWyK4hlJw6zGwKac1YFzeAFLfS9d64+mgNgMYgTWib06U=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from BN6PR01MB3283.prod.exchangelabs.com (2603:10b6:404:d7::22) by
 BN6PR01MB2546.prod.exchangelabs.com (2603:10b6:404:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.22; Fri, 2 Jul 2021 01:20:42 +0000
Received: from BN6PR01MB3283.prod.exchangelabs.com
 ([fe80::31fc:d5b5:2ca2:445f]) by BN6PR01MB3283.prod.exchangelabs.com
 ([fe80::31fc:d5b5:2ca2:445f%11]) with mapi id 15.20.4264.028; Fri, 2 Jul 2021
 01:20:42 +0000
To: openbmc@lists.ozlabs.org
From: Hieu Huynh <hieuh@amperemail.onmicrosoft.com>
Subject: [OpenBMC]Create new user with Redfish group roles
Message-ID: <333ada20-6cd7-0bc6-768b-d1a6bf5cd503@amperemail.onmicrosoft.com>
Date: Fri, 2 Jul 2021 08:20:29 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
Content-Type: multipart/alternative;
 boundary="------------568441FA26D026DB29DAB7A3"
Content-Language: vi-x-KieuCu.[Chuan]
X-Originating-IP: [27.68.156.230]
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To BN6PR01MB3283.prod.exchangelabs.com
 (2603:10b6:404:d7::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.20.10.2] (27.68.156.230) by
 HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Fri, 2 Jul 2021 01:20:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f10f053-f6ea-4ac0-94f6-08d93cf79c08
X-MS-TrafficTypeDiagnostic: BN6PR01MB2546:
X-Microsoft-Antispam-PRVS: <BN6PR01MB25468F43BE97A213D2767A9F801F9@BN6PR01MB2546.prod.exchangelabs.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ScxtklWezmaIYff/E1jGGjQBqXWRlSSRTTYZK8ba62E0NlV4O2/6+DGitJEKxxnJvOWtrB5JWNoJx9gxgZBzaaQatSL4tyr7AE8I9oBGh6E+/tEa7vrEy8gRWIShWcVx5pUwphQmoppjEiRE4z0mpJaEtfM3Q+pvftLi5yj95eiUtKjArsG54ongm9NIIgyPtDQEUiCgeBlvI5NF6B5AyFfB7SPaiu9Uzm7BUZcjevGXUlPIiY/1qe43UcoxCqrWsDa0IAJ0d4PzeRICeV7a86jMtWLH7jPs96Zrkag1FhUDUK6WNt6LexKkL1qIvtkHVaLe/NaEulMtp7h1DCI3vVxWKMcHmA+i46l3VsWy2w/j4dm/RJkd0OzaKbvPbQ3iKVgM/su3tTs6A9OmmHHrFag5slqzqEsCVx1CVndk3I33jcb5DomL/upADpVCXBXhZNbxPXOuoZchbUqZjMZXktjgMGMVEV5oHU1iyNV7weHWnZNGeDTkgJsJsDEsxyAqOPWWY1k67OEH8Mc0atyb7cOaxkvU1p+lat3iY269x7EDiCbRp+/5ej6+C76nwfNGZHWqaafHg71/32OZth8+jNWnylm4QJ/pSjcow2Ds81qSlkt17Md+YDqvQU5dKwo26ClP23AWVxwHEA8TZL3d7LiDAVELqb60bFag+Xur59adxdfhN2LoL0H5LJY2bcLuYnYpbeY/KopXwp3/+lOu4ycZxiW4f2Voh6i45dbrKSLw/rEcDkH7vQtIXi1zdAnpo95ux+UeBgFJSGl776uJ7/Qrlb+iLcrp6YUUnWdPM143nUuR5ManmfEZ9+GZJUneLma+rTN1fYInW2EcZngGwEMq9kNE0EzoRG9a7jSGKkry1bk5oEesXSTb70u/vsI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR01MB3283.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(366004)(376002)(346002)(136003)(956004)(2616005)(4326008)(52116002)(31696002)(6486002)(31686004)(8936002)(33964004)(316002)(107886003)(8676002)(16576012)(38350700002)(66476007)(83170400001)(38100700002)(66556008)(26005)(66946007)(2906002)(186003)(16526019)(42882007)(6916009)(5660300002)(6666004)(966005)(83380400001)(166002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UER1S21CYmt3aGZhRVh6alpDbm5SSDZoek83SHJpUDYza0dnWUxuaUlSRWJP?=
 =?utf-8?B?Z0tlcFcvc3dYVzBrdGZTV1ZhWU16SkVOVGo3ckVlZVEvam1uVzd6SE1Fc2dr?=
 =?utf-8?B?dTZPeVNCQnJxUDZqcHJoR0k2NHc2MjdqS1ZORURXcUljRE1FTUsxamIvVHZo?=
 =?utf-8?B?cnZZVks4TjIrclhwOFd3Z0d0Y2tvM0xyRG1UbkxIZEQrVUdJM1hTREZKQ0Rn?=
 =?utf-8?B?RE4xdXlBSFFWTXl2YTlvZDRaajNDa2ExdXBQTUVTc2xCSFZaTmpFbjhVZW12?=
 =?utf-8?B?WW5mZndjZHkxQU1IcStSL3dhRlpreXZ3REk0cGE3V2RBelF0YmVQSTZnWnRQ?=
 =?utf-8?B?c0VtU0FvZy9pQ3Q1dW1mNlJScnBMUm1za0RNS2xqZjc0dlRSalYvMTlqSm9r?=
 =?utf-8?B?OTE5RTZVMk5jZ0pGZFpzOGMyeExKcUNKdndXTDZrb2FuZFU5YTArL1ByWjNS?=
 =?utf-8?B?SlQyZlI3RWZvekpYKy8rb2svL1A3OXp4QlNueVBOMituSkNFR2swTEhuVVg4?=
 =?utf-8?B?d3hKaHpkYjZCV2xsdkFRK3FDR2JQc2Q2RHlYMDVhN3A2cG1kbWVBTVh3dGNm?=
 =?utf-8?B?TlU2cDkvRTMwWUhOaU8yM1RpNHFrTE1YNGlmK0Y2SFRsWjZ6YTMzZndUVndF?=
 =?utf-8?B?RVdxV3p6N2VVaXdqYm9YeXEyWGkrSkxzSmNYSWQ3VGl4d0xFMi91WjZTTXE1?=
 =?utf-8?B?dzU5RUdRTk9Dck1hS1IvWk9JSC9RZ3UyMy8zYUk4VDFqTTNTQXdSUnk2TXFE?=
 =?utf-8?B?cFo1ZTJSR3ZhRm5GelJrTnlqZzR1VDAyMjB5TTBNdHpwN00vUExLRGtudXdw?=
 =?utf-8?B?V1kramFLb25wSHFMUUFBK0NFWW9FZmVWZndaUWkrWVdNSW9yT1pXL2Q0ZlE5?=
 =?utf-8?B?N3RtcHFLRTNzZGNVUjN3eFlvTUFOZElkUTVUYXJBVVdhWHltNlZDNG5UQnRm?=
 =?utf-8?B?bzdBN0h5Tkx5UlVaZktmMUJRaUZqZDM1K2dRUXNydGVSTUtmcDBZdWxKSE0v?=
 =?utf-8?B?clBuQWM5QW1iR2ZUKzFRTGpKaGM1dUhBWHpyaWZmSGZ4MzREZmk2ZWd5YXFj?=
 =?utf-8?B?bEJOcmRNZ3ozWGptU29FaTEzN3JaNmxqS1FsMEFRajFzQjV2N1hEQ1lQY2p0?=
 =?utf-8?B?SzJYUkxicWpqeXdNN2R2K2pXdmNUbGtCbDNOOFhyNTdBK3RNYkZoZVpkVndt?=
 =?utf-8?B?VmRaeFE0MVhUMzV3Vkp3UG1JZDN6bW9yMTNhL1BWeGxmdjRYd1E3dGNhdXBF?=
 =?utf-8?B?WDBJVVQvb3l2OTRabFVKRHFnRXR4c1BadXhTZG9VZGNYUWtEOHZqcGZHQnBC?=
 =?utf-8?B?NG9SR1l1b0FwRDV6TWI3N3pSNGhXQmhWa2JWelcyV25UK3Q2ckpoWG03VlFQ?=
 =?utf-8?B?SjRlVUJoL1pYVmpMek9LenNGa0NJUjZOVnltNFdJRml3bTNWVmZRUGwvSGlt?=
 =?utf-8?B?OEwyeHRVMy90Y3F5MkdWMWlqeFN3amNweUFDNTIzUGIyelJkRUN0QjNIQWNM?=
 =?utf-8?B?K2p0UVVrNVk3TGdKdnlKTmptbURJZUFuaFRGNDRlVzFFRk9UR2R6Sk1kUGph?=
 =?utf-8?B?OGxHWi9WbXQ3OEFhTm0xVGJPZzdrR0FCdGZqdW1DcGhGR3kwNFNTZEh6NXIv?=
 =?utf-8?B?eG8zSkRLeSt5ajdjVEIxRW9hNzJzS2dXSmJXWjhEQUhLeEtVRlR2bXZraDlk?=
 =?utf-8?B?eWVEeXI4QytNVHp3eEN3U2FvbzU4Z0ttRS9PYXh0cWUzR05hZTF3TVFBTTl4?=
 =?utf-8?Q?0Lp80vc70ua11iPNqHdJ3uINDnE9bfs/N440e6d?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f10f053-f6ea-4ac0-94f6-08d93cf79c08
X-MS-Exchange-CrossTenant-AuthSource: BN6PR01MB3283.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 01:20:42.6540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNjWYPvR+SQ56uSBqw0GNnatHSF43Ed4rFhVCUsX8TK/XOeeSVtT7BIjm4w+dtp22AXOMyvNVo5rnhESJKvgeIOoYsIGI7iDPpFIAOlaHcWqZks9CKcb4D2O3oloKaGW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2546
X-Mailman-Approved-At: Mon, 12 Jul 2021 12:42:33 +1000
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
Cc: richard.marian.thomaiyar@linux.intel.com, rajeswgo@in.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------568441FA26D026DB29DAB7A3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear all,


Base on the document 
https://github.com/openbmc/docs/blob/master/architecture/user-management.md#supported-group-roles. 
The user with Redfish group roles is defined: "Users in this group are 
only allowed to use REDFISH Interface.".

How can I create a new user with Redfish group roles? I mean this user 
can only use with the Redfish, no allowed for IPMI, WebUI, or SSH.


Best Regards,

Hieu Huynh


--------------568441FA26D026DB29DAB7A3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Dear all,</p>
    <p><br>
    </p>
    <p>Base on the document
      <a class="moz-txt-link-freetext" href="https://github.com/openbmc/docs/blob/master/architecture/user-management.md#supported-group-roles">https://github.com/openbmc/docs/blob/master/architecture/user-management.md#supported-group-roles</a>.
      The user with Redfish group roles is defined: &quot;<span style="color:
        rgb(36, 41, 46); font-family: -apple-system, system-ui,
        &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple
        Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">Users in this
        group are only allowed to use REDFISH Interface.</span>&quot;.</p>
    <p>How can I create a new user with Redfish group roles? I mean this
      user can only use with the Redfish, no allowed for IPMI, WebUI, or
      SSH.</p>
    <p><br>
    </p>
    <p>Best Regards,</p>
    <p>Hieu Huynh<br>
    </p>
  </body>
</html>

--------------568441FA26D026DB29DAB7A3--
