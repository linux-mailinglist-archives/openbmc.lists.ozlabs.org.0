Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC662EAEB9
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 16:39:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9GrV4wKWzDqgx
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 02:39:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.128;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=+ionTI2f; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2128.outbound.protection.outlook.com [40.107.94.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9Gqb2WLPzDqXS
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 02:38:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyqbKgwyQwbc8LPgUiUHMA2CpAIefgSvegGkrD9fuG5Q6zpmaPzR4RigTHeh4qw2OJN+kcyuyUlF5Ahg8pqDOF838AHt7FfzQYeKu+zHN7Eby0bBaCzkPrOEZemVTpZZwwnIOaZoGg3ef4tDXffWjfJMKXP/Kj+bBQerKS0deHgi7mIUvAztFxEGGht7JtFAL5e8TSWuKwwUl4upudi1wAJe2oaNKE6bzOz3mW0Fa7capEqZD/VV/kKRHXGi7wXk/3TGq/IQbSgGOc2PQzZg4kO5p4SGSTFLK0KtWtwAfAfw19dUuiFvRf2OhN2J3tQwgAdudCQQ2qwD7nGX22T+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SraIh2PEI7tUxwsn3JveADDR0stNDvWk8DXRsFD0BOQ=;
 b=W7V0KSuUl1o9WnXy/6sVuw+vRw/ZeT7vKD3jgXcu2qovjqwsDf+aUXlGQGkLFZRhd3IxprMX8UV2is7oKnweozUQiUTAPp5le9hawqK/OrWmloiHSsCTUEox4Ft15dtOXPJPlAdnkTgRoNCENzcQsNR5BbQzEz0UCg718+V22RxdNmK6vDmpr2iQk6Q561eogGag97tDWODFdnIoAWujeTviOvJinQmhWWeMxxigfioXwz0v1XknvSx6Ex/s+hpcUq1Vc5UEUBQLGo+PwRQUhr0fFagLuaA0H7I+crDSKQuhFp9xrEfUvVdLNK6Tpg2BiyERU+FhjeY/J7Od+nVz2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SraIh2PEI7tUxwsn3JveADDR0stNDvWk8DXRsFD0BOQ=;
 b=+ionTI2f93OFr0M3F7gJpTLymXlBMhEIVWTi3VPzi2P+FCHpR2irWc4YCxv10folxoWjmY9HISHzNNR2U3hR4QGNPB76xad2QPePlBFMXgZWJAQJnEc/Re2UjUkcK1Ygx0vbDyylewMm8JLFOwRvFOgHG7BCzHbD3pIlyKSWTeo=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB5835.prod.exchangelabs.com (2603:10b6:5:14f::27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.24; Tue, 5 Jan 2021 15:38:26 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::f0b8:2176:ea56:dc57]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::f0b8:2176:ea56:dc57%5]) with mapi id 15.20.3742.006; Tue, 5 Jan 2021
 15:38:26 +0000
Subject: Re: NC-SI driver: Detect OCP module power down!
To: Milton Miller II <miltonm@us.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
References: <OF1171F140.21EF2A71-ON00258652.005BFA8E-1609692280165@notes.na.collabserv.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Message-ID: <24584f99-bbc8-8cb7-39e6-c49f5e35defb@amperemail.onmicrosoft.com>
Date: Tue, 5 Jan 2021 22:38:13 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
In-Reply-To: <OF1171F140.21EF2A71-ON00258652.005BFA8E-1609692280165@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="------------DD1660D226521C98026F4B4F"
Content-Language: en-US
X-Originating-IP: [2402:800:6344:4074:9099:43f0:cd20:866b]
X-ClientProxiedBy: SG2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:3:17::19) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:6344:4074:9099:43f0:cd20:866b]
 (2402:800:6344:4074:9099:43f0:cd20:866b) by
 SG2PR02CA0007.apcprd02.prod.outlook.com (2603:1096:3:17::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.19 via Frontend Transport; Tue, 5 Jan 2021 15:38:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a337774-bccc-48fc-84f7-08d8b18ff1a8
X-MS-TrafficTypeDiagnostic: DM6PR01MB5835:
X-Microsoft-Antispam-PRVS: <DM6PR01MB5835454BA6BF7261BFF2EABB90D10@DM6PR01MB5835.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 96j6SLx4VNnWx/4M4Wz6n+rvA4BidGRW/0LeITDEpQR+IrZtL2w5KTdCs+tURq/RAv/IlQ/Nzy7EPemM92yr4TuQXY9T5rsoDJHZbXLx/FxlKr9fQdcd0sq5gNcV+6fZViaOmOEi40I+XEg+a7EVm5Jmz8BQ6UcXExHwkQs1NCKoMUEEvdonrlX/nSPsbPKwbAK/PitJ8hhSeYP0GnWUtVC+AMzNP+r55DP+f1gK1G0y9kihFaUPXWGCqGL37bsaSEXmMaxl5uDW2vXtjONFoUhvrSq62poKoohuCFo/rPNeENEf4327j8NuSBC1G0M+n/69eqpse7wmk7KR/LdbMgvnVW2XfErgv8mXprsKaG2IRtGzPBAqu9HGK2BcZjGPQMLLTWHDp0BEoyi3P0DT+m82tOthnel2jYZGghBWXw4cwMX2V7JNWofdcDsyE2koZaqFEkXTfB59x7eMqL7qpThZNd/Bnm/ihkiKWGndWHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39830400003)(346002)(366004)(186003)(66556008)(2906002)(16526019)(110136005)(33964004)(31696002)(31686004)(66946007)(6486002)(8676002)(8936002)(66476007)(316002)(6666004)(42882007)(83170400001)(52116002)(53546011)(83380400001)(2616005)(5660300002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bm9nelR4ckFuMjEyMm1BbTVQbSthQzg2aWhZWVI2UzBMM2tYdUdIOFIwaFZZ?=
 =?utf-8?B?VG56MFBQekRjT3FKcjErUTcxZ25xQlEvdkswdG9MbkxOMi9kYjh3RUNvbnQy?=
 =?utf-8?B?QUE4ZGx1dHlSY29DejZCL2F5emF6aEIxNmVrSFN5RlI2L1VtVy9VYlZ0ZFI0?=
 =?utf-8?B?cS9FVHpENTc1ZWxHNUxVbW8rTDJEQTBEWDQvL2tGRVY1Y1RTQ3NXb25BZFE5?=
 =?utf-8?B?UkZ1NXM4WGIra0ZscnhDNENRbUllUjdZT200WkNBdmxJT252OExLcTAydDI3?=
 =?utf-8?B?MnhhK2cyR01FTHE0Q0plTkxUeURONWE2SFB3NjJsaDhmY25raTNIWE5CR2pN?=
 =?utf-8?B?RTkzZ3g5YnI5ZzFkRk9TdFZGRUpLQUV2VnRFOWVsVFh1Vm5JQTBDd1h0b2Vp?=
 =?utf-8?B?cTV6dWZJVmwvaVAwNXA2TkxDaUdZR05Bc2p2M0EvMURDRFpUZ0hmZktxMXFK?=
 =?utf-8?B?bitPck9FemFBZTQ3NVBaakRFZWJjNDJHaFVMbFNzUDllZHlIbk84TzNwSzk2?=
 =?utf-8?B?SEUyV1RJVzVsbUxwTE84M25sdy9CeXR1K3I1bnFaN2pkTExodzZNdVhaYWN3?=
 =?utf-8?B?RXBLazUxNWdXVFBsbmQ4T1pjcnhwblA4d2loRDJlMXo2NURteWhmNXdTd0Rt?=
 =?utf-8?B?Q0JKWWczTlNCV2phSlhySmlOSEQ4K1BRK3lkRkZjVE1TWUo3WkZsbmhva2Iz?=
 =?utf-8?B?NU9qQ1pkenNzRVVEU29RVlhDVGtiRzVqSURxUHo1ZmRrQXN1cVk3enpBd3dn?=
 =?utf-8?B?L3FrdC95M3NERGNUbTZkbVZpdlc0eGI0WVRTc0N5N2hHb0llU1k3eDFtd1VU?=
 =?utf-8?B?dXJzNHpwcWFQbXlUUnZKTEJpK1dSdzBmWnpOSVA1VnVhSmxuRlNNZkRhQlhC?=
 =?utf-8?B?VFZrVUhpWUthZmIrVW43YW13ZjJ0OXhSQWdsZjUzNjd2OXVDcitBZzBsRCtZ?=
 =?utf-8?B?K3c4VUtoMzhyTUd6eTB0enZvM2k1UmtuK2IzRHBEVmtxUVJBVEthZnBHMXRX?=
 =?utf-8?B?V2NvWHkycHVHTGt2L0F1VFVzaXVNMzNyUWJ3eWgxUjhoSUt0ZDV4aHhhT2I3?=
 =?utf-8?B?SjFNdjFRNkVEK1pWQ0EzTlBhdWs1R3dvQ3hKVklQMHRvM0IxVmhyY3RaWW55?=
 =?utf-8?B?eDBPbDNYeithZU1YbVE0WEFFRjhPK1ZQdE1mRWdJWXRwRWlpb296OWQySDBK?=
 =?utf-8?B?bnlxQ3pNdW5YaVQ0S2pKOWxZaG5uaXhkNDFXK0xEdXV3d1FyNUZHcmQweU9R?=
 =?utf-8?B?TSt3d0wzSVVXVVREVlNPTVZaNkZ3TUFIdHluRDNIcHM5UUNkcnFJSlBiblA5?=
 =?utf-8?B?RjloRVNheGJmTGtxTURHOXh3SWQ3THIxREFpdHJDNWVJQ1lRVjM3aXBOMjVj?=
 =?utf-8?B?aW1pTnlvT2ZUNXZmbW9OVEFZR3h4MGJJcXBXbU5YU2ZGSW10Rkg4bTlyRGhv?=
 =?utf-8?Q?tzjCXtnK?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 15:38:26.4228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a337774-bccc-48fc-84f7-08d8b18ff1a8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjmKLWQ7fuu+sWuVTyFlsVb89i5pGQRFuwY/Sp0K59xc5oAiHu4X05IJa1VhpK3pshTXFHHQ7xnngY/+bcctxYM9l/5ZX1d+n6vmxPa229o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5835
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

--------------DD1660D226521C98026F4B4F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/21 23:44, Milton Miller II wrote:
> January 03, 2021 8:45 AM Thu Nguyen wrote and miltonm@us.ibm.com 
> <mailto:miltonm@us.ibm.com> responded:
>
> In our test platform, BMC boot up with NC-SI module is plugged and
> powered. NC-SI interface (eth0) is up and worked well.
>
> Then the power of NC-SI module is power off. NC-SI driver can't detect
> this state.
>
> BMC console keeps print:
>
> [ 1780.411126] ftgmac100 1e660000.ethernet eth0: NCSI Channel 0 timed out!
>
> [ 1785.579455] ftgmac100 1e660000.ethernet eth0: NCSI: No channel with
> link found, configuring channel 0
>
> [ 1802.253375] ftgmac100 1e660000.ethernet eth0: NCSI Channel 0 timed out!
>
> [ 1807.501456] ftgmac100 1e660000.ethernet eth0: NCSI: No channel with
> link found, configuring channel 0
>
> Look at the ncs-manager.c code, it seems if a channel of NC-SI module is
> time out its' monitor_state will be disabled, the link will be down then
> the driver will go to next channel.
>
> But if all of channels of NC-SI module are down. The driver will reset
> the monitor_state of all channels and check their states again.
>
> Milton> The NCSI specification explicitly says that power to the nics 
> and the controller must be synchronized.
>
>
> Do we have any mechanism to detect power off state of NC-SI module?
>
> Milton> No, but the state machines will reset if you ifconfig down the 
> interface.

[Thu] Thank for this info. It seem there are no ways to detect Power off 
state of NC-SI module.

This case is similar with the case OCP is failure or Unplugged when hot 
plug.

>
> How about hot plug NC-SI module?
>
>
> Regards.
>
> Thu Nguyen.
>
Regards.

Thu Nguyen.

>
>
>
>
>
>


--------------DD1660D226521C98026F4B4F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 1/3/21 23:44, Milton Miller II
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:OF1171F140.21EF2A71-ON00258652.005BFA8E-1609692280165@notes.na.collabserv.com">
      
      January 03, 2021 8:45 AM Thu Nguyen wrote and <a href="mailto:miltonm@us.ibm.com" moz-do-not-send="true">miltonm@us.ibm.com</a>
      responded:<br>
      <br>
      In our test platform, BMC boot up with NC-SI module is plugged and
      <br>
      powered. NC-SI interface (eth0) is up and worked well.<br>
      <br>
      Then the power of NC-SI module is power off. NC-SI driver can't
      detect <br>
      this state.<br>
      <br>
      BMC console keeps print:<br>
      <br>
      [ 1780.411126] ftgmac100 1e660000.ethernet eth0: NCSI Channel 0
      timed out!<br>
      <br>
      [ 1785.579455] ftgmac100 1e660000.ethernet eth0: NCSI: No channel
      with <br>
      link found, configuring channel 0<br>
      <br>
      [ 1802.253375] ftgmac100 1e660000.ethernet eth0: NCSI Channel 0
      timed out!<br>
      <br>
      [ 1807.501456] ftgmac100 1e660000.ethernet eth0: NCSI: No channel
      with <br>
      link found, configuring channel 0<br>
      <br>
      Look at the ncs-manager.c code, it seems if a channel of NC-SI
      module is <br>
      time out its' monitor_state will be disabled, the link will be
      down then <br>
      the driver will go to next channel.<br>
      <br>
      But if all of channels of NC-SI module are down. The driver will
      reset <br>
      the monitor_state of all channels and check their states again.<br>
      <br>
      Milton&gt; The NCSI specification explicitly says that power to
      the nics and the controller must be synchronized.&nbsp; &nbsp;<br>
      <br>
      <br>
      Do we have any mechanism to detect power off state of NC-SI
      module?<br>
      <br>
      Milton&gt; No, but the state machines will reset if you ifconfig
      down the interface.<br>
    </blockquote>
    <p>[Thu] Thank for this info. It seem there are no ways to detect
      Power off state of NC-SI module.</p>
    <p>This case is similar with the case OCP is failure or Unplugged
      when hot plug.<br>
    </p>
    <blockquote type="cite" cite="mid:OF1171F140.21EF2A71-ON00258652.005BFA8E-1609692280165@notes.na.collabserv.com"><br>
      How about hot plug NC-SI module?<br>
      <br>
      <br>
      Regards.<br>
      <br>
      Thu Nguyen.<br>
      <br>
    </blockquote>
    <p>Regards.</p>
    <p>Thu Nguyen.<br>
    </p>
    <blockquote type="cite" cite="mid:OF1171F140.21EF2A71-ON00258652.005BFA8E-1609692280165@notes.na.collabserv.com"><br>
      <br>
      <br>
      <br>
      <br>
      <br>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------DD1660D226521C98026F4B4F--
