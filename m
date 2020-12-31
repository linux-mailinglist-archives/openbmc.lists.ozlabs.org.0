Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E148B2E7E9D
	for <lists+openbmc@lfdr.de>; Thu, 31 Dec 2020 08:40:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D60SX0cQJzDqLC
	for <lists+openbmc@lfdr.de>; Thu, 31 Dec 2020 18:40:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.128;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=ohK1Tmtc; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2128.outbound.protection.outlook.com [40.107.220.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D60RR5YS3zDqGp
 for <openbmc@lists.ozlabs.org>; Thu, 31 Dec 2020 18:39:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bR73jamgCpM8TBmsVKiXn1HKwuqwmxHECCy/eTd/jRvNc/aeBmtdhjQZMalSf1Hwneb65yGZ61WBUcnByVRDkUAsYG0VsZrojRfjcQoUp2afQf20CvWd6j4jMrAgDVs49OCweYKYWeEBPUh6j/mmcdw5VnKxlJ67hj8NmkDFnwV8cITFZRFYjEJYKv1izn/OMeEcIeSbYmVOPPp6DDDgNTLXAYp+pLvzA9U6d/5Yy6RKNRuRY6lF+4LtRBB/alGPRbz6DpdClQyjDU+Dxlkp0o8zAynOOPAMVeJ0KVZ/O2DpYWDjFivxCQhDcxtKnnbJo8zRzI+EVfqWdybKSbEfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOlz1gRJP/2EH9x2g3dBeLcUKoI2YU97oTO0h6b+qh8=;
 b=Y9u3xG4Es85in7cOohRRvIa9WyvDBg7N3ZXpZbRhdOuBxSuIBfZb22vuX43MOef08B8et8/hsRfGX6qkYnoomyf2uC4qb4wBzTzrK6//BiUaqc9tfKH3xLKeXgT43TsUHuVv9npfToi5HUE3LYKr/9aK/2W+Gu1SvZ7o4vyVIgYOqNe34LAjruYRillZw2t5by4wk0y3+ofNBL32ZxjHH6Wafpk0sazXIKeeOegIMvNVmyxki3PufA+qk2wZh68bnLoP6ktxPjG+EssnShrsOWTof7pHFvFpsBC9J6i1iEmclm+Sm8jtpN+xP/a302ASOPJOO5GoNxUvlHzEMyRc9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOlz1gRJP/2EH9x2g3dBeLcUKoI2YU97oTO0h6b+qh8=;
 b=ohK1TmtcbG7rtAaEKyB40AxQlMsYcyP4PVIBuEu8A3yaF3UBtS3W9VTcjOBfbm3/rfqsvcMH1oMoshDJLg5OkoVDG/13m3utYt7v/7bs1qvz6U03uW49F81PNcsxEK6KRu0LikJYZOLu13Huj0k/kPAEmekLglb1/N2yQfIZ7/I=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB3817.prod.exchangelabs.com (2603:10b6:5:92::17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.29; Thu, 31 Dec 2020 07:39:37 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::f0b8:2176:ea56:dc57]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::f0b8:2176:ea56:dc57%4]) with mapi id 15.20.3721.020; Thu, 31 Dec 2020
 07:39:37 +0000
Subject: Re: Ipmid not work on eth1 when enable NCSI.
To: Vijay Khemka <vijaykhemkalinux@gmail.com>
References: <2cd25ea6-f957-1536-cfb5-ba9aa2a31611@amperemail.onmicrosoft.com>
 <CAJTGxZESn=fr4OxP70JNAM0hnmR5vE7xC11ScbfbdeNiwd5bgA@mail.gmail.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Message-ID: <6bff103d-e665-80e8-3dfb-f5d6bee360d5@amperemail.onmicrosoft.com>
Date: Thu, 31 Dec 2020 14:39:28 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
In-Reply-To: <CAJTGxZESn=fr4OxP70JNAM0hnmR5vE7xC11ScbfbdeNiwd5bgA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------48180D954BE0BDEF80040400"
Content-Language: en-US
X-Originating-IP: [2402:800:6344:4074:c0f1:57f8:1af1:bc2a]
X-ClientProxiedBy: HKAPR03CA0013.apcprd03.prod.outlook.com
 (2603:1096:203:c8::18) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:6344:4074:c0f1:57f8:1af1:bc2a]
 (2402:800:6344:4074:c0f1:57f8:1af1:bc2a) by
 HKAPR03CA0013.apcprd03.prod.outlook.com (2603:1096:203:c8::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.4 via Frontend Transport; Thu, 31 Dec 2020 07:39:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adb562a7-d9ab-44ab-f4aa-08d8ad5f39d3
X-MS-TrafficTypeDiagnostic: DM6PR01MB3817:
X-Microsoft-Antispam-PRVS: <DM6PR01MB381733F1E85CF59B28687A3E90D60@DM6PR01MB3817.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +gFJ3wTJ89HozapxJAqH+LKiXfC9OHC8nsWMMElAWXBdQ9YcYAPRk85ouU3l0vlwwnjv1Oz2wEGUMIuXj2GLORgbXJ1pwfCcklsc7u3FJtu3gHQkf/J6kfQGOb4qtWr8qHa4v7L6rsEVqtSFl0X9lCPM64y8c+FZqUlO8rBx1nFrGelw+pd41cPI1B76i0APNUBviixEkrVF+nf2zCLoRpBZ9uCG3IxDlU13Miorh0EqcTrmLYyokDm1NsUiB6BOeNITdpl6yNQWvMU3e3/OU+1TbU0pWESLoMVhcvbzlghjh5tN8ed8gsHJmDnWtNOzlrgnl8rm6QM7Hsbsa4ux5SQFKuRWy4pKobAdv0Rie/+vXZprKodLc7BHwaGN8H76ZZ0A3Mg7a98fIQtfKtPgTnZ2FPPbmGGtB9tEmmuVnWEj/DBmo2Y5McrjiUQO8Py8lsogM3m4EUFPEd976TyKV5hFzfhIqRBSHlUSM5rBx3Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(39850400004)(136003)(83170400001)(83380400001)(66946007)(2616005)(66476007)(186003)(4326008)(2906002)(66556008)(33964004)(8676002)(31686004)(6486002)(52116002)(6666004)(5660300002)(53546011)(42882007)(8936002)(316002)(16526019)(31696002)(6916009)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZGIwT2ZjODU3VHEwdjZKV2VhZ1QxTCtWcHVpeDJsOG9wYVdBK1lVTVZDcUJZ?=
 =?utf-8?B?Y0tuVExOMnp3ZTBkZXFGWU1lQzM3OTFkQUNPK3QzdHJJOU5OOFZZTVdTOWlO?=
 =?utf-8?B?amFPREVwVFJ6dUxoWmdyQTFBeXM1bG8ydnJLcEhWZFhTejEvcjZIRm5MVWxw?=
 =?utf-8?B?VjZIcmp0Tk90N3hQdU1DUXc4MUowOUh1dlU5UER3Wmw0TkcrTGg2cDdiZ2VG?=
 =?utf-8?B?c2ExNVNpYnA4aXAyVWRzV0MyVEJGWm43cHROWmgvYUtDenluVjJaOXFhazJq?=
 =?utf-8?B?TXhTREx2d20zSUFucktwRHp6aGdtL1FESWZubEM1OHhoa3d5dmZVYjFHUjVE?=
 =?utf-8?B?dDBmcEJ2WXI5NStNY1VCZ0RCVHJ5a2YzeVZZUWRMenFMN1huVFQ2WnNpcHND?=
 =?utf-8?B?ZUJRcHRuTG8wWmkxZ1ZCa05VdCszNUJDL1U4YUgvL0d3VFc0R2lVUTFLYnJK?=
 =?utf-8?B?dWVoL3pnQk5VR1Uvd3RtTHhMeEpBVmh3RzkyR2hzdy9oQXlZcHlIOWVLZkUz?=
 =?utf-8?B?RDBSSFJaOVc1Q01nQkJyYWt2bmNLYUtNTGo3eVpLamVBZWxxZjYwK3kzMXlk?=
 =?utf-8?B?SFAwQ1RxZkdFTXB0Z04vWlZ5RWxYR0tVU2tubzQxcUhERnVTOHN3RVd5T09K?=
 =?utf-8?B?cy95SDhEMTA4VjJUVTV1Y3VQQXNibmlkbXhEVytPRDZLUnhYWTllRVc2VGEx?=
 =?utf-8?B?UHpjR0dZRXExdjZqc0owWGZORm91RmorM2Y1ZzFTVU5ueCtuR291ZTZHTkpp?=
 =?utf-8?B?REZQNGt3QmRtckprMkJhSm1uc1NqbHJhdlRRa2ZTRVZsQU82dXA1cFVYR3JB?=
 =?utf-8?B?Uzl4Rm0wQkQxL2tBc3JNaElVZVF4RlFtUk5oblYydCtjMEZBQXhzNkNNSzMr?=
 =?utf-8?B?MXk5V3lzMElpWG1XcndybW0vMjJ2c2t4RHB3dlZYei9pcUlHampwWG5pUjFw?=
 =?utf-8?B?VkpiRWltS2dRY0gyUVJ0dXZCclRVU2tHem1Yb2MweWl4RmVUekFKWEVYam0z?=
 =?utf-8?B?Ylp2bW1jRmlib1JZWlFDenNpeHk1Y1BhbVpMZnphZG9wQnJKR2xqNnZnVlZt?=
 =?utf-8?B?dUNLc0YxQ1F2eXUzcWtyallFZWo2WFRUeXEwVmFyUlZzLzNaVjVjejhHenpI?=
 =?utf-8?B?UStjbHBUblJGaDhRak01QTY4aWNQb2hjbWd3ZzgwcHJ4ZU1pdEQxbCtxcEF2?=
 =?utf-8?B?eHZnK0MvOVAwSlo3RlpVR1huMmJ1ejh2c1JpMTN5clE4TFp6M2Z5Z3pMYTJa?=
 =?utf-8?B?UWdmeVB0QWtOUTN6MkdGSWNrNXV2V2VuTnJIMENIazNyMWUyRnlEWUtKTkFT?=
 =?utf-8?B?WnR0RVgxeUh0TFBxR0lZbktNYkRtME9UckI0aUphR3RTbjJ1b29EQWpOQnAy?=
 =?utf-8?B?akQ4d0ExTllaUHp0VmZpMXVCTjcrMUFGSXZOcndnRCs3ZWpXNVQxaHU4TFhv?=
 =?utf-8?Q?RrBS27sh?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 07:39:37.5396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: adb562a7-d9ab-44ab-f4aa-08d8ad5f39d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7V1uVQx15dC9B4O/l8iZvkCSezABIZbW39ScxbRDRlnSN61zdfimiCZg2zwkefIqzL07YGCGrkGgGL9AJ6wRnWmE1GVFKj9ohqoDOQgd7Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3817
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------48180D954BE0BDEF80040400
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/30/20 12:09, Vijay Khemka wrote:
>
> On Wed, Dec 23, 2020 at 7:59 AM Thu Nguyen 
> <thu@amperemail.onmicrosoft.com 
> <mailto:thu@amperemail.onmicrosoft.com>> wrote:
>
>     Hi All,
>
>
>     I'm verifying NCSI with my Mt.Jade platform.
>
>     In Mt.Jade platform, we have the shared NIC in eth0 interface and
>     dedicated RGMII in eth1 interface.
>
>     I used below steps to enable NC-SI in Mt.Jade.
>
>     1. Add definition in DTS for MAC0:
>
>     &mac0 {
>            status = "disabled";
>            status = "okay";
>            pinctrl-names = "default";
>            pinctrl-0 = <&pinctrl_rmii1_default>;
>            clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
>                     <&syscon ASPEED_CLK_MAC1RCLK>;
>            clock-names = "MACCLK", "RCLK";
>            use-ncsi;
>     };
>
>     2. Add build configure to enable OEM Command to get MAC for NCSI.
>
>     CONFIG_NCSI_OEM_CMD_GET_MAC=y
>
>     After these steps, My system can detect OCP card, can get MACs and
>     both
>     eth0 and eth1 interfaces are up.
>
>     I can access BMC Web use both ip of eth0 or eth1. The same for
>     Redfish.
>
>     BUT I can only use ipmitool with eth0. Ipmitool command not work with
>     eth1 interface.
>
>
>     Check the setting of phosphor-ipmid-net in
>
>     meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/channel_access.json
>
>     meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/channel_config.json
>
> You have to configure in this file for eth1 as well.

Because these files in 
meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/ are already 
configured for eth1.

So I don't think I need configure "channel_config.json".

I missed below setting in phosphor-ipmi-net_%.bbappend

+ALT_RMCPP_IFACE = "eth1"
+SYSTEMD_SERVICE_${PN} += " \
+        ${PN}@${ALT_RMCPP_IFACE}.service \
+        ${PN}@${ALT_RMCPP_IFACE}.socket \

This cause IPMId also listen in eth1.

>
>     I can see that ipmid is configured to listen on both interface
>     eth0 and
>     eth1.
>
> How do you make sure it is listening on both interface
>
>
>     Do I miss any configuration here?
>
>
>     Check the journal log, I saw some errors and warning from NCSI:
>
>     Dec 23 10:14:50 mtjade kernel: ftgmac100 1e660000.ethernet eth0:
>     NCSI:
>     Handler for packet type 0x82 returned -19
>
>     Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0:
>     NCSI:
>     'bad' packet ignored for type 0x8b
>     Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0:
>     NCSI:
>     'bad' packet ignored for type 0x8b
>     Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0:
>     NCSI:
>     'bad' packet ignored for type 0x8b
>     Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet eth0:
>     NCSI:
>     'bad' packet ignored for type 0x8b
>
>     Because NC-SI interface is up, so I just ignore these errors.
>
>
> These errors can be ignored, it doesn't harm in any communication. We 
> need
> to fix this  into the kernel.
>
>
>
>     Regards.
>
>     Thu Nguyen.
>
>
>
Regards.

Thu Nguyen.



--------------48180D954BE0BDEF80040400
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/30/20 12:09, Vijay Khemka wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAJTGxZESn=fr4OxP70JNAM0hnmR5vE7xC11ScbfbdeNiwd5bgA@mail.gmail.com">
      
      <div dir="ltr"><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Dec 23, 2020 at 7:59
            AM Thu Nguyen &lt;<a href="mailto:thu@amperemail.onmicrosoft.com" moz-do-not-send="true">thu@amperemail.onmicrosoft.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Hi All,<br>
            <br>
            <br>
            I'm verifying NCSI with my Mt.Jade platform.<br>
            <br>
            In Mt.Jade platform, we have the shared NIC in eth0
            interface and <br>
            dedicated RGMII in eth1 interface.<br>
            <br>
            I used below steps to enable NC-SI in Mt.Jade.<br>
            <br>
            1. Add definition in DTS for MAC0:<br>
            <br>
            &amp;mac0 {<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status = &quot;disabled&quot;;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status = &quot;okay&quot;;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names = &quot;default&quot;;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 = &lt;&amp;pinctrl_rmii1_default&gt;;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clocks = &lt;&amp;syscon ASPEED_CLK_GATE_MAC1CLK&gt;,<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;&amp;syscon ASPEED_CLK_MAC1RCLK&gt;;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock-names = &quot;MACCLK&quot;, &quot;RCLK&quot;;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use-ncsi;<br>
            };<br>
            <br>
            2. Add build configure to enable OEM Command to get MAC for
            NCSI.<br>
            <br>
            CONFIG_NCSI_OEM_CMD_GET_MAC=y<br>
            <br>
            After these steps, My system can detect OCP card, can get
            MACs and both <br>
            eth0 and eth1 interfaces are up.<br>
            <br>
            I can access BMC Web use both ip of eth0 or eth1. The same
            for Redfish.<br>
            <br>
            BUT I can only use ipmitool with eth0. Ipmitool command not
            work with <br>
            eth1 interface.<br>
            <br>
            <br>
            Check the setting of phosphor-ipmid-net in<br>
            <br>
meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/channel_access.json<br>
            <br>
meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/channel_config.json<br>
          </blockquote>
          <div>You have to configure in this file for eth1 as well. <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Because these files in
      meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/ are
      already configured for eth1.</p>
    <p>So I don't think I need configure &quot;channel_config.json&quot;.</p>
    <p>I missed below setting in phosphor-ipmi-net_%.bbappend<br>
    </p>
    <p>+ALT_RMCPP_IFACE = &quot;eth1&quot;<br>
      +SYSTEMD_SERVICE_${PN} += &quot; \<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PN}@${ALT_RMCPP_IFACE}.service \<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PN}@${ALT_RMCPP_IFACE}.socket \</p>
    <p>This cause IPMId also listen in eth1.<br>
    </p>
    <blockquote type="cite" cite="mid:CAJTGxZESn=fr4OxP70JNAM0hnmR5vE7xC11ScbfbdeNiwd5bgA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            I can see that ipmid is configured to listen on both
            interface eth0 and <br>
            eth1.<br>
          </blockquote>
          <div>How do you make sure it is listening on both interface&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            Do I miss any configuration here?<br>
            <br>
            <br>
            Check the journal log, I saw some errors and warning from
            NCSI:<br>
            <br>
            Dec 23 10:14:50 mtjade kernel: ftgmac100 1e660000.ethernet
            eth0: NCSI: <br>
            Handler for packet type 0x82 returned -19<br>
            <br>
            Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet
            eth0: NCSI: <br>
            'bad' packet ignored for type 0x8b<br>
            Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet
            eth0: NCSI: <br>
            'bad' packet ignored for type 0x8b<br>
            Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet
            eth0: NCSI: <br>
            'bad' packet ignored for type 0x8b<br>
            Dec 23 10:15:05 mtjade kernel: ftgmac100 1e660000.ethernet
            eth0: NCSI: <br>
            'bad' packet ignored for type 0x8b<br>
            <br>
            Because NC-SI interface is up, so I just ignore these
            errors.<br>
          </blockquote>
          <div><br>
          </div>
          <div>These errors can be ignored, it doesn't harm in any
            communication. We need&nbsp;</div>
          <div>to fix this&nbsp; into the kernel.</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            <br>
            Regards.<br>
            <br>
            Thu Nguyen.<br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p>Regards.</p>
    <p>Thu Nguyen.<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------48180D954BE0BDEF80040400--
