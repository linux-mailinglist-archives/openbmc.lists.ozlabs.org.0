Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AD1304D69
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 01:21:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQPQs1ysJzDqcn
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 11:21:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.95;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=hieuh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=8aAY+A0s; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2095.outbound.protection.outlook.com [40.107.93.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM6Xk2qTqzDqP1
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2021 02:59:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbJJ/h2E7VyFxEufG7etrf7QoLr9CWQjHxyjY895/q/aw8L/polqxIvGLRhzCEMCriVa5XlBaSxpoxBgpteiyoc3vpUds8hqhnFQhdC2htQptnzGKvmgV2SLS4YMjqdMwLuabCNRnuH90pW8ppuJ4f3Ua7PUUnaKd5KxHDdCZaYMHat6NqXvpEwQCIFEQhE4KeUm2M/eYn2hKZz8R+XKCbrSTjLETSmogMeJksTeVhrDhF1szgumDhF3FLO2xK7TxBhteSEypuJiu7yD/RqfI9WycLOQ0wVZzruyL1aHPkmsUSctZdKuIhUghgDw/l7P5vKHxcI1vzAsa/igZX4lPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do4IUYNCSrv15m87A4gU3qUAGWvSclZjXJdc76UXsO8=;
 b=bFt88EfVaaSy8zuIBq1t9T3Q1CKXA98Zv/nkv1GDquB3w2kKpxU8PsRiRvrZuSYCvurHVA36KQdZZzDl2qzlwW9U9Tvq3BVLIvnwNlWUsq8+55rZ9D+8AAaw00AOxQgGj2eHid956E9AkwQ8oHUPY63edcRXQQNUyxV/BFvUL5XMG7U+Jjow4lGucWjcv2WXrxvw+XabuRa7/xObJBjIfTCxTha9WF77PcsbZK6cYLZ/HZwOXS3kEf8e+ylm9cqVM5td1ZZaZ/J07euIE0gXMPi6Y/AbdyUdm0OsH2nBMa+3duJ9KvzRbj+xAWfnsgXaTURyHvzn7cQZHXFszrgbjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do4IUYNCSrv15m87A4gU3qUAGWvSclZjXJdc76UXsO8=;
 b=8aAY+A0sJ+PELLfaPLClBw+sCd62dd7s3pTcIAgQ5pMFGdRMDk/iwkuhZ/L/BfZ8etpjOQP17k+TdJueDe+03dbr2p/sQLQRKI3+X9urxRIQeoJu5L24MXJOTBkSfYWrx5YbmBUP7U4hMGytviaktLZImgq5/OIZLsagvgxF1pc=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from CY4PR01MB3285.prod.exchangelabs.com (2603:10b6:903:e8::11) by
 CY4PR01MB2248.prod.exchangelabs.com (2603:10b6:903:22::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10; Thu, 21 Jan 2021 15:59:40 +0000
Received: from CY4PR01MB3285.prod.exchangelabs.com
 ([fe80::432:604e:ec56:b8cf]) by CY4PR01MB3285.prod.exchangelabs.com
 ([fe80::432:604e:ec56:b8cf%6]) with mapi id 15.20.3784.011; Thu, 21 Jan 2021
 15:59:40 +0000
To: openbmc@lists.ozlabs.org
From: Hieu Huynh <hieuh@amperemail.onmicrosoft.com>
Subject: Can not get the Virtual Media D-bus Object
Message-ID: <7ee438bf-a07e-10ca-a1c2-72d989f33705@amperemail.onmicrosoft.com>
Date: Thu, 21 Jan 2021 22:59:30 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
Content-Type: multipart/alternative;
 boundary="------------82D74718B601F0A977C2F050"
Content-Language: vi-x-KieuCu.[Chuan]
X-Originating-IP: [2402:800:631d:dfff:5155:9ae8:c1ff:847]
X-ClientProxiedBy: HK2P15301CA0001.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::11) To CY4PR01MB3285.prod.exchangelabs.com
 (2603:10b6:903:e8::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:631d:dfff:5155:9ae8:c1ff:847]
 (2402:800:631d:dfff:5155:9ae8:c1ff:847) by
 HK2P15301CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.0 via Frontend Transport; Thu, 21 Jan 2021 15:59:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcc9762b-2135-4a53-6e96-08d8be258f18
X-MS-TrafficTypeDiagnostic: CY4PR01MB2248:
X-Microsoft-Antispam-PRVS: <CY4PR01MB224853F515CFCBB89369C60180A10@CY4PR01MB2248.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MlzMsxGYc1aMsBNb+atyGOw+LZTHo4TaCSN4z/um9K+h7xOsPsxQLeyNMPPcuRnpp3IXDImmA+bgc5HrZbBNFyY0t9Ui4f0qWPibEo9aSad0HIn/c0vUYwavZ0QMOijk9QXGaZHtinkO93q5rOE/pNsDIuJb60T2eNO0r86iGhc2hiveMlsfg3ShCDzv47eu2VEhPyhQfdxGnj5r6EsSEHwITBzoLca2ZbE+hFlr2x39o72FQIJb7zuQE2AGRNII2V14Ig4+VcaRYvlNNgH/o0AqNZ8gNtgeMdPwIfUpIbiIqkTXQac9g9vlp7/18dFev2pcTcV/EgDRqnOyLySZD/Z/NWSdHg5XyIFqE3deVqbTtXrPFb02hmlH9QEjEydEhx0z44N0bNOg0oXjdBrWXRfW9PntdAJI8cC3EHP3AITV0jy+hvhoKVpRbOAB+Ld3H6xAcqwiL3iuV63x+UFuQU/sQ8MPQw5d/FPa6JG6o+dlMbNPd8NYrA98yqatKSEYyQnG64Verv75M2YcyPOMpKFQZbD8BTC8xNgoLnXAPqJgWS9R5HOyE49qzqdXm/Bi20oW2ipnV111YDR1pYYRXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR01MB3285.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(6019001)(4636009)(346002)(366004)(39850400004)(136003)(396003)(376002)(6666004)(52116002)(186003)(966005)(8676002)(42882007)(31696002)(83170400001)(66476007)(6916009)(66556008)(166002)(316002)(2616005)(8936002)(83380400001)(66946007)(478600001)(16526019)(6486002)(2906002)(31686004)(33964004)(5660300002)(15583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aUh0cjhvZGFUemRHS254eVozMjFRVGw0RVN6dVJrUll6M2lDTVJyOWRESFlU?=
 =?utf-8?B?TkpxQWpVWm5hdHhUWGFReHFxeitvQ2JNa1ZTazlFRHhMSGZBcUc4dVhxdmty?=
 =?utf-8?B?RmozdkkrOEdzODkzVGVqSG8veGpYQk53cXhmZzNTVGZoaXNjUkN2WndEKzNh?=
 =?utf-8?B?cDJSaTdUVUdCNHl0SGV1RlgzMy80TldVVjlTemJBMGt3YWNKQzhKMGtxWUNU?=
 =?utf-8?B?YW1UcDRrcThGVWtJUkVHeVZYbUZBRDNtbVJjU1dHWHk5dHJKa3lObkhDK2tj?=
 =?utf-8?B?MWoxWFBOU1ZJeE5xRUh6ci9kdUNxblU1TzE5NlRnOUpubUVUcERLUDlSWE1Y?=
 =?utf-8?B?NFU5ZDYyczJ6OUhHVWVkUVRsaHJCSmwzYnNyeGd1cGJnbC8xcUplT1YzWW93?=
 =?utf-8?B?NndaOVF5VnlWWkpIbnJsT3RIWm1hUTVBVWEwbm1kYnBUVWF3ODBsTDdnUDVY?=
 =?utf-8?B?WFpDNDg4TFlIM083NnlyRUVjZG8wN3hLTmNXbVBFMUh0akpZcmNISTN6eS9H?=
 =?utf-8?B?bnR3ZWVBUXc2ZllUaTM3Z2lqYklBNFRTNXgybmV1NWZJcm11M2htQnNIRWFw?=
 =?utf-8?B?Y0lIckVhSXBPWk1rcWpaL1ZxdVpWb0tFa3BYQ0M0bGNwSXZWRVJYa1pYWkxZ?=
 =?utf-8?B?b0RzOTJZa0dFN3dDcDN1MEZyN1hEMzNDUnBlcEdRUm40aVhHZEJoZDI4WWxP?=
 =?utf-8?B?czlBTkhpanBaRmFlNlkwSE1nTVlGcFJ0dVJ5eWNSRG56em00YlAwVjBSOVJq?=
 =?utf-8?B?V0Fsa2s1T1ZMQ0p0QmxjbHJMMDhrYjBwcUlGbGZwNENaOURlWkh6cUJxRElq?=
 =?utf-8?B?WW9vQjdvK3hteDgzR0FpQXRxaUhsaWhDYWpwRW5BTCtxdVFxZVhRc0ZxQzNK?=
 =?utf-8?B?T3NRMnBPVUhIVEwzZU5sNFhtZ3RSR1NVTm8vZzNYWTNRc0ZIanFsOC96eHVJ?=
 =?utf-8?B?ZXhSM0VQNWdzWFdmWmlsVTNDMGVRVGZYTlVBdUpmZTc3cHNLRXN6WUExTzZH?=
 =?utf-8?B?THF3NzBZc204MXlyY05MajFHbHJ6RzdTYjJYR0IzNDQrZWlNUjNscW5Sazlx?=
 =?utf-8?B?VmlyY2xGYTNtRDNuaTZEWS8rRkMyVGJYSTVxYmVhMGd5NGJQMkg4VFZadXhN?=
 =?utf-8?B?VnYxcXBwL3phZG8xNkJMcHdaSWRmc2I4UFlpRXg4SWpqaXhFMHdWR1pVYm8r?=
 =?utf-8?B?ZmFDdDRzY0VZeFVRT1dWbWhVZUw0SnpSZTluM0NDRmJaVTdtNjFwT3dDbGFs?=
 =?utf-8?B?bnF1QUpEUEtOZVFndktaL0I0K0hDU29TOEtoUUgySXAwWFl2TmFod0N5RDAx?=
 =?utf-8?Q?gk4w+U8/JuvP0=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc9762b-2135-4a53-6e96-08d8be258f18
X-MS-Exchange-CrossTenant-AuthSource: CY4PR01MB3285.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 15:59:39.8524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUznOPDCtBZMvRwIqG4G1lAG9q9tG2vhvpDC0WDgCv2Hqn77zjV360QGpD7PlEOFYTj/PFnVL6x4sPcN91Kmoj/Ocun9lVh+yLIcaHhcITbfhzkBWUTM+ADySBFQ1/yP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR01MB2248
X-Mailman-Approved-At: Wed, 27 Jan 2021 11:19:02 +1100
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

--------------82D74718B601F0A977C2F050
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

When get the Virtual Media Collection I have the issue:

{

"@odata.id":"/redfish/v1/Managers/bmc/VirtualMedia" 
<https://10.38.66.105/redfish/v1/Managers/bmc/VirtualMedia>,
"@odata.type": "#VirtualMediaCollection.VirtualMediaCollection",
"Name": "Virtual Media Services",
"error": {
"@Message.ExtendedInfo": [
{
"@odata.type": "#Message.v1_1_1.Message",
"Message": "The request failed due to an internal service error. The 
service is still operational.",
"MessageArgs": [],
"MessageId": "Base.1.8.1.InternalError",
"MessageSeverity": "Critical",
"Resolution": "Resubmit the request. If the problem persists, consider 
resetting the service."
}
],
"code": "Base.1.8.1.InternalError",
"message": "The request failed due to an internal service error. The 
service is still operational."
}

}

The BMC console will show logs:

bmcweb[1066]: (2021-01-21 02:56:35) [ERROR "virtual_media.hpp":1099] 
ObjectMapper::GetObject call failed: generic:5

The issue happens because does not have VirtualMedia object on my system.

1. As I know the VirtualMedia Object defined on phosphor-dbus-interfaces 
https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/VirtualMedia. 
Does any config for VirtualMedia available on my system?

2. What is the Virtual Media modes of operation? Proxy or Legacy?


Best Regards,

Hieu Huynh






--------------82D74718B601F0A977C2F050
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi all,</p>
    <p>When get the Virtual Media Collection I have the issue:</p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">{</span></p>
    <div class="tab" style="margin-left: 2em; color: rgb(0, 0, 0);
      font-family: monospace; font-size: medium; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial;">&quot;@odata.id&quot;:<span>&nbsp;</span><a href="https://10.38.66.105/redfish/v1/Managers/bmc/VirtualMedia">&quot;/redfish/v1/Managers/bmc/VirtualMedia&quot;</a>,<br>
      &quot;@odata.type&quot;: &quot;#VirtualMediaCollection.VirtualMediaCollection&quot;,<br>
      &quot;Name&quot;: &quot;Virtual Media Services&quot;,<br>
      &quot;error&quot;: {
      <div class="tab" style="margin-left: 2em;">&quot;@Message.ExtendedInfo&quot;:
        [
        <div class="tab" style="margin-left: 2em;">{
          <div class="tab" style="margin-left: 2em;">&quot;@odata.type&quot;:
            &quot;#Message.v1_1_1.Message&quot;,<br>
            &quot;Message&quot;: &quot;The request failed due to an internal service
            error. The service is still operational.&quot;,<br>
            &quot;MessageArgs&quot;: [],<br>
            &quot;MessageId&quot;: &quot;Base.1.8.1.InternalError&quot;,<br>
            &quot;MessageSeverity&quot;: &quot;Critical&quot;,<br>
            &quot;Resolution&quot;: &quot;Resubmit the request. If the problem
            persists, consider resetting the service.&quot;<br>
          </div>
          }</div>
        ],<br>
        &quot;code&quot;: &quot;Base.1.8.1.InternalError&quot;,<br>
        &quot;message&quot;: &quot;The request failed due to an internal service error.
        The service is still operational.&quot;<br>
      </div>
      }<br>
    </div>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">}</span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">The BMC console will show logs:</span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">bmcweb[1066]: (2021-01-21 02:56:35)
        [ERROR &quot;virtual_media.hpp&quot;:1099] ObjectMapper::GetObject call
        failed: generic:5</span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">The issue happens because does not
        have VirtualMedia object on my system.</span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">1. As I know the VirtualMedia Object
        defined on phosphor-dbus-interfaces
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/VirtualMedia">https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/VirtualMedia</a>.
        Does any config for VirtualMedia available on my system?</span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">2. What is the Virtual Media modes of
        operation? Proxy or Legacy?</span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"><br>
      </span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">Best Regards,</span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">Hieu Huynh<br>
      </span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"><br>
      </span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"><br>
      </span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"><br>
      </span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: monospace;
        font-size: medium; font-style: normal; font-variant-ligatures:
        normal; font-variant-caps: normal; font-weight: 400;
        letter-spacing: normal; orphans: 2; text-align: start;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
        text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;"><br>
      </span></p>
  </body>
</html>

--------------82D74718B601F0A977C2F050--
