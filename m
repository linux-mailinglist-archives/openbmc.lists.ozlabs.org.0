Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9441031E3ED
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 02:31:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgxyK4tJdz30M5
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 12:31:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Gnr9nZz8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.69.101;
 helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=Gnr9nZz8; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690101.outbound.protection.outlook.com [40.107.69.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dgxy241myz30Hn
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 12:31:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBlbUdoDK7BwCqPSx+vw46WgUYfkFaCtgWE964wDmakYGaxnuuz3VcS9ihLEKzJDu7SGnLE8F3m6n46ygpb18zkuYN9WqGpGf1+BsoVFC54jtWWqJ7u4RFP70TN4UA3IiATm+in519ZBjjZFUMWzFXP9e9XTPVF6/J8lnFgRhVz2Dy/t9uStufzzPfkuACRqVVCg9EQFxwztlIx3NB0A9Gcl8lCVSUTYg4+SLMwVtX4FjuyM9LXF1MajoC/r84p4WhXig69dxytIiPCAKYMcITPzVv2F5H9evbidmINt7Qr4BVZg0JR0tHfnyAwI4YSoyl6emaF0eGldo98g1L5kWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGvqO92Z3FB8+jgy9gCdnhFNOf741QojB3+0nEvHW2w=;
 b=MblKbf+Z8bIZXBoHfElvq875Fmur4bjfSUHfGRkty+mVeYf8Cd84vHG68oFjHqWhiqOmlWbiKsMvdvyJ9wwcZ0GgD3zcs8Gnu6X/biyAQvHCCOEIIj3jpuZh+xgBM7K88Xyb5QuWcms4+MZd4VG8eTa0+WMr0d7fSVY3BjsD20yiQAhCLuelK0WByZ6s9ZmUcaOYcQWFQEyGhHdYqiz4onVGjzWRRi7dwhfN+vI0W6WAAWzZKpvJRkhihXHskehgNgqdxINzfeRPlAxCAczYo2+ZPehFRNkGDTkhjTFPzwx1X56PLGbvXWvNm/0TIFDZdA7S2EuN2FfX+tZ8a8zkQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGvqO92Z3FB8+jgy9gCdnhFNOf741QojB3+0nEvHW2w=;
 b=Gnr9nZz87s38CvRpd2LPPv3Z1MM/RYR87Pro/SJjG9yeGDmVqQpNvSzZ/my+TcmjEArDNjfMS9XUIJNbi027z71U1ZjkSeiQAZy6CWJP+xc2Xogz2EaeQB7eT3DBF2ydOMH01r2lnaVkk0pkZs39M0b74MlW7s5wjWbQ2hAdiKs=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BY3PR01MB6628.prod.exchangelabs.com (2603:10b6:a03:369::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.29; Thu, 18 Feb 2021 01:31:31 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3825.040; Thu, 18 Feb 2021
 01:31:30 +0000
Subject: Re: Any convention on putting source codes into openbmc/openbmc
 repository
To: Nancy Yuen <yuenn@google.com>
References: <71820e5a-1231-1937-1344-dee9f4a03600@os.amperecomputing.com>
 <CADfYTpF9yX0xheCwu5mftWs9b4YAe=ttGNNsf7GL8KkpW4dAcw@mail.gmail.com>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <42403202-49c9-2b85-1207-4c84ec491332@os.amperecomputing.com>
Date: Thu, 18 Feb 2021 08:31:21 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <CADfYTpF9yX0xheCwu5mftWs9b4YAe=ttGNNsf7GL8KkpW4dAcw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------0F39530537A062C2C8D1F202"
Content-Language: en-US
X-Originating-IP: [113.23.108.203]
X-ClientProxiedBy: HK2PR02CA0154.apcprd02.prod.outlook.com
 (2603:1096:201:1f::14) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (113.23.108.203) by
 HK2PR02CA0154.apcprd02.prod.outlook.com (2603:1096:201:1f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 01:31:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1b72962-3915-44b3-e045-08d8d3aceb27
X-MS-TrafficTypeDiagnostic: BY3PR01MB6628:
X-Microsoft-Antispam-PRVS: <BY3PR01MB6628E3C5FB309A4CE5C76DEF8D859@BY3PR01MB6628.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n1YV7iUAOwCy4Rv5UvGzGmva34QZYz9KD5zjMs6LgZiUYyUkOA5zR5T0A81Pt3AuHoVHtNIA0EaHECsorbZVIgw5rLuDc5KRY8tXLJtwFY0mo4ruwZmXYMBlJjFHGXZiGiZhxkwIPgRyJ/vqGrWnUFLbPpChFBv7AEpPOg1kB7g9jnVzplWAQuSKCdSEzy4It858ToH7k/MUi6CatwLjpRGEYjtWwCWq57wO9SQ07WnQHIM+pkC98/9J0DclwwlwljlTc6BX3D6cOsOT6aO5xgeYSkttrtohZMOtm0Bk92Za1lEg2miT4KAhWFZ8On/DvU8yAYGMJ3rO/+ba0BWnOOkr718t4UuNC1MzJf91ISp/uLHA3BnKJXk7wa25tmLfbJPF+9rUGJhK7Hd9uGHV4CVU4D5v1s7ee0vbkJC51H2s2rDOV/WU57Z7m4CGN9Bz2iSz5hrKCLVfjgaMeGiM80nA17QJ4YnlyGbSvIw/R5gOX3Wf52Px92fgskR2ZuyEUCL/qRJrOtpAaN3Jp1RA+TXcC4qm1M4fk7Lv7s0S8MUIGlDhZ6Hd2T+rtgjjFn8FC2RiBUFfGPC9jEMYwdtv1d9fpMBw7VKEP7Kf4fd+ZFkjgw7582zuQTtTNjjKNrYK/3A6fJzO9XZT8oCLPRZkH90P8b4XDWbGEc5k82N6DMLxApgxLUfXF+/PX0xm38k+O7qmeXszWEAViKAdhcBdLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(136003)(346002)(396003)(366004)(4326008)(2906002)(186003)(16526019)(86362001)(8936002)(33964004)(6486002)(6916009)(66556008)(66476007)(52116002)(66946007)(956004)(2616005)(31686004)(8676002)(966005)(6512007)(31696002)(166002)(478600001)(316002)(6666004)(53546011)(19273905006)(26005)(5660300002)(6506007)(45980500001)(43740500002)(563064011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VytIdkFGeDcxcktwMGtrUkVxVVJ4T1pLWmpHajBPMEtjaU9Wd0RONC8zUUk4?=
 =?utf-8?B?K093ZStHcmszZDdHVGdqK1lUT2FFYUZlM1crdjBqb2hVUG52S3h3QldXUDFh?=
 =?utf-8?B?ZzRIQmpUQkV3VE1vUzV6SjRuQUtsMkRSc011YnA3Y3M3RGY4SDhDRzBDYlRx?=
 =?utf-8?B?MUlJSWVXaHZBYkladlR4NVE1WmtjelBQSTlQV25iUzR6MEFTaG8xNnBnaUJ4?=
 =?utf-8?B?RVVnQXpZRm1nU0l4SzNpYnJyeWQ1S0s3Y2NuNVZhMmhBNWRzTGtJK29DNCtw?=
 =?utf-8?B?dE5BZzQxNS9Dd0V2dkFTZzU5dmxHajBzWFZXVUJwVEx4R1NlbE1qQUdxYjZB?=
 =?utf-8?B?QTNzTVBKSHNZZVBQWkZ1YUNlQStXVWNvTnhzeU1XMUlETFA4UzQwRXIzTUpH?=
 =?utf-8?B?bkR6QjhSQ0gzS0pOWTdtSGg2L2s4cUV3ek1PL08wdS9xVUI1UDdpLzVDL01y?=
 =?utf-8?B?c1RCTnFWcHFTeUg1WG1TUUNEeXBVT201ZlFQTWhPRUxkM0YwejR5RjQvWE1v?=
 =?utf-8?B?UTB1SHlEOHRsSG9DZVRiYlViNzZlRTVISTRPbXh5NGVCNjJsZXRvTmRBbHVZ?=
 =?utf-8?B?UHp2UWR3OEIzdzlvN3hJZENHNE1udFIxYnNQR200b0tQNjJncktxci8zTXFq?=
 =?utf-8?B?THpFSmhhOGRtZjdET1REQXNFN2NtSG4xVFpZcUJHNW9nK1owdzVFZGU5blZj?=
 =?utf-8?B?dXBGRU1xZC9uVzA4VnNvSUt3RFo3ZjUwblpDQmlmRXNVUXJIOGVKRmUzV2hD?=
 =?utf-8?B?OU1wdDY1d2lLdkhScE1GbGtSci9XaTZudWxiTXo2UXhjQ0pvSnpNa2lQZkp4?=
 =?utf-8?B?S2Qxa1p3V0o0ZFJzQ2VzNEVBNExuS0MwUmdOY2dTUEFGWnZJNlFzcmp3WWZK?=
 =?utf-8?B?QUlBSVR2OXBmUjIwdW1uTzZ1eHhEcDNnVzZrZjBDOGxZV0hWaXh6dW5aQVdv?=
 =?utf-8?B?d1hVZ0FwWm5QWFVRVmQ5ZmlUM1VOcVFFTFN2QkNLQ215aWhqTHVxSVFERUUy?=
 =?utf-8?B?dnZYRS9VRjdLMTh5Wkhzc0ZxUGxVM2xlMmhWUTM5V0VwM0pKVSttYVY1M2tD?=
 =?utf-8?B?aDNkblNNMkQ4RVVYMGVMQjZjQWZLMEJLa1dtU3E5ZmtrRHdRUC9vMDNNZ0R3?=
 =?utf-8?B?VUVueU5LcDhoTjZhYzBReXgzcXl5bWFCMUhQY3hkU0Zra0NnVW9ZTDdVYlNk?=
 =?utf-8?B?dFRiemdTRUZFSURIbmYzZ1V6M2U3MFJZakhaT2dRSjFUeDhNMHhNQ20xcFRa?=
 =?utf-8?B?ck9WUC9EbUc5Mmd5TjljYWVsb2VxVmdYVjlPa1h1WTYxWC9FVGJPaU5OQ0FS?=
 =?utf-8?B?MHdMaG84U3QrMWdpUXZYWnZoS1VuZDZCZ01ueXQxU1FkeGc4dngzcWdWTEZE?=
 =?utf-8?B?UzM2MGdPSFZRZGVkaXF2ZEIrUkNzUElvVHlRZERzVVpxTzlvVGRQRG9ZRVlj?=
 =?utf-8?B?cEE5d3YwbXoyZHVIUitaa0Z3NlZLRDk4RS9TZ2dwbWdBRHBobHNvN3FWbjh0?=
 =?utf-8?B?dGRVcTV5bTRLNS9JZTdrTVZlNGp2TmVPTmVmTTRjbDNpNkNtejQ1c0tLRjdM?=
 =?utf-8?B?VFFxeitPRFV2bVRhTUhHellybTFONytOSUhqWDRjeXJUL0h2WmpWb0pjbURp?=
 =?utf-8?B?OGJ3SnZScEo0VjRNblZiVCtKWFBmWG55MXNPNW1JNExSUXQyc1pSY1dOeFFQ?=
 =?utf-8?B?SjY2TUlRT1VsNVd3UWYrR200NVBmaFhVY1JkM1F0TlRJQTE1Yk56YmdkVGxW?=
 =?utf-8?Q?Fuzwzs3/UNqx/mi4b8wvoRDJD0IuVFKVQZ4Yu7G?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b72962-3915-44b3-e045-08d8d3aceb27
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 01:31:30.8158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nN2TAh1hKmTwR8Qfxl2T2ctJmvT7xcUWmRI3oEd+fISu2sI1KSuUyUFMwOCwF7jzdCjYt4NJQuHu7W4TfUvdHi8RRbp2bzDHSlqi3INmRZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6628
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

--------------0F39530537A062C2C8D1F202
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/02/2021 06:46, Nancy Yuen wrote:
> Code should be put into an appropriate repo, and repos created where 
> necessary.  Then referenced in recipes from openbmc/openbmc metalayers.
Thanks Nancy for the feedback. Do we have requirement for this or just a 
recommendation?
>
> On Wed, Feb 17, 2021 at 12:55 AM Thang Nguyen 
> <thang@os.amperecomputing.com <mailto:thang@os.amperecomputing.com>> 
> wrote:
>
>     Hi,
>
>     We implemented several features using c/cpp codes. Currently we
>     put the
>     c/cpp source into the openbmc repository like below:
>
>     https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-ampere/meta-common/recipes-ac01/host/ampere-host-error-monitor
>     <https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-ampere/meta-common/recipes-ac01/host/ampere-host-error-monitor>
>
>     https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-ampere/meta-jade/recipes-ampere/host/ampere-scp-failover
>     <https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-ampere/meta-jade/recipes-ampere/host/ampere-scp-failover>
>
>     I check from http://github.com/openbmc/openbmc
>     <http://github.com/openbmc/openbmc> but don't see source
>     codes put there. Is there any rule that prevent source codes put into
>     the openbmc repository?
>
>
>     Best Regards,
>
>     Thang Q. Nguyen -
>
>
>
> -- 
>
> Nancy Yuen
>
> 	
>
> •
>
> 	
>
> Google Platforms
>
> 	
>
> •
>
> 	
>
> yuenn@google.com <mailto:yuenn@google.com>
>
> 	
>
> •
>
> 	
>
> Google LLC
>

--------------0F39530537A062C2C8D1F202
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 18/02/2021 06:46, Nancy Yuen wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CADfYTpF9yX0xheCwu5mftWs9b4YAe=ttGNNsf7GL8KkpW4dAcw@mail.gmail.com">
      
      <div dir="ltr">Code should be put into an appropriate repo, and
        repos created where necessary.&nbsp; Then referenced in recipes from
        openbmc/openbmc metalayers.</div>
    </blockquote>
    Thanks Nancy for the feedback. Do we have requirement for this or
    just a recommendation?<br>
    <blockquote type="cite" cite="mid:CADfYTpF9yX0xheCwu5mftWs9b4YAe=ttGNNsf7GL8KkpW4dAcw@mail.gmail.com"><br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, Feb 17, 2021 at 12:55
          AM Thang Nguyen &lt;<a href="mailto:thang@os.amperecomputing.com" moz-do-not-send="true">thang@os.amperecomputing.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
          <br>
          We implemented several features using c/cpp codes. Currently
          we put the <br>
          c/cpp source into the openbmc repository like below:<br>
          <br>
          <a href="https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-ampere/meta-common/recipes-ac01/host/ampere-host-error-monitor" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-ampere/meta-common/recipes-ac01/host/ampere-host-error-monitor</a><br>
          <br>
          <a href="https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-ampere/meta-jade/recipes-ampere/host/ampere-scp-failover" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/ampere-openbmc/openbmc/tree/ampere/meta-ampere/meta-jade/recipes-ampere/host/ampere-scp-failover</a><br>
          <br>
          I check from <a href="http://github.com/openbmc/openbmc" rel="noreferrer" target="_blank" moz-do-not-send="true">http://github.com/openbmc/openbmc</a>
          but don't see source <br>
          codes put there. Is there any rule that prevent source codes
          put into <br>
          the openbmc repository?<br>
          <br>
          <br>
          Best Regards,<br>
          <br>
          Thang Q. Nguyen -<br>
          <br>
        </blockquote>
      </div>
      <br clear="all">
      <div><br>
      </div>
      -- <br>
      <div dir="ltr" class="gmail_signature">
        <div dir="ltr"><span>
            <div dir="ltr" style="margin-left:0pt" align="left"><span>
                <div dir="ltr" align="left">
                  <table style="border:none;border-collapse:collapse">
                    <colgroup><col width="76"><col width="7"><col width="111"><col width="7"><col width="122"><col width="7"><col width="71"></colgroup><tbody>
                      <tr style="height:15pt">
                        <td style="border-top:1.5pt solid
                          rgb(213,15,37);vertical-align:middle;overflow:hidden">
                          <p dir="ltr" style="line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style="font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,102,102);background-color:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap">Nancy Yuen</span></p>
                        </td>
                        <td style="border-top:1.5pt solid
                          rgb(102,102,102);vertical-align:middle;overflow:hidden">
                          <p dir="ltr" style="line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style="font-size:11pt;font-family:Arial;color:rgb(255,0,0);background-color:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap">•</span></p>
                        </td>
                        <td style="border-top:1.5pt solid
                          rgb(51,105,232);vertical-align:middle;overflow:hidden">
                          <p dir="ltr" style="line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style="font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,102,102);background-color:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap">Google Platforms&nbsp;</span></p>
                        </td>
                        <td style="border-top:1.5pt solid
                          rgb(102,102,102);vertical-align:middle;overflow:hidden">
                          <p dir="ltr" style="line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style="font-size:11pt;font-family:Arial;color:rgb(61,133,198);background-color:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap">•</span></p>
                        </td>
                        <td style="border-top:1.5pt solid
                          rgb(0,153,57);vertical-align:middle;overflow:hidden">
                          <p dir="ltr" style="line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style="font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,102,102);background-color:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap"><a href="mailto:yuenn@google.com" target="_blank" moz-do-not-send="true">yuenn@google.com</a></span></p>
                        </td>
                        <td style="border-top:1.5pt solid
                          rgb(102,102,102);vertical-align:middle;overflow:hidden">
                          <p dir="ltr" style="line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style="font-size:11pt;font-family:Arial;color:rgb(0,153,57);background-color:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap">•</span></p>
                        </td>
                        <td style="border-top:1.5pt solid
                          rgb(238,178,17);vertical-align:middle;overflow:hidden">
                          <p dir="ltr" style="line-height:1.38;text-align:center;margin-top:0pt;margin-bottom:0pt"><span style="font-size:10pt;font-family:Roboto,sans-serif;color:rgb(102,102,102);background-color:transparent;font-weight:700;vertical-align:baseline;white-space:pre-wrap">Google LLC</span></p>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </span></div>
          </span></div>
      </div>
    </blockquote>
  </body>
</html>

--------------0F39530537A062C2C8D1F202--
