Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE48E37244B
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 03:46:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ2k56FM3z2yyx
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 11:46:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TwKoCKMj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.96;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=TwKoCKMj; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2096.outbound.protection.outlook.com [40.107.223.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ2jj2dR7z2xZM
 for <openbmc@lists.ozlabs.org>; Tue,  4 May 2021 11:45:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOmyzNf3b+WbfmpRTFc36QCLdMU7w60rCpqPM6ZQA7YVMWkK22QpKeedYPsYICQjZNqLHvVp/QMKcUSr0roWXlID9HtHEoegwLAZpLe7ZyIDeJ9jJjhGr29/go6M6khQxfdrwYA2xlo7pVgnCRfVyjz+7bxUg76mdPx07jvOhtCyMVv8OKvquO770tRMdXgq8q4osPmstSKq4Lup80/a3EJgJyrfIuLOjT7NExkRa0tF0SlKhf9nBcSvtFHuRY7k1GCr29pn6rHgYHGKUSp27SWkMmbez8j9CTZnkX5WeKNc39IVuLdU6wWvRVQVbIuJu9LKjYqzAdW8FY+6BKRw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7i3K4nCbhaSItDN738oL1H7KXeeh2ut21HZYpLKz/Ag=;
 b=iJBQTI13jJiNvxN7DSXG2BO/VqGYTScKpffO0KCGLOyxjYnc/dlZfKuB9LQL0bcOKlsNm0nRZY6uYRaJhoyLRjkajIxurSyXrLk7PfvSrYlLoao17E+em+/zfz3Ax9KCQSxhW5M7lMCCbRstSsFr0c085Ni5qC7mWoxyu8u7L3PhKy6PQGsjakqSFRdXmwfmkSMXQmWdZWvYmyaUYeiPQvB8HfcSNK64x3NEu3FptsEBoXDoLmtWRembOsEYsMrg+7Uuizd9g1sc1Hz/fC+t+CfOzUWbzYnn9WHUI+msdin2EVOL5qtffHifpje3X6/Ns87Jo7j/JZEOjb+RAhta4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7i3K4nCbhaSItDN738oL1H7KXeeh2ut21HZYpLKz/Ag=;
 b=TwKoCKMjdI5atWbQc2THJFtHYRcWcnNogoWDo1/Slfqeo3GvJ4nlYoqZ09eTnbseq3hfK++X6RgzK2g0I3k3OZKqaUT/SnlxJtulIP4IbmjcdLqDxQUghU0jWr3zQMUjWW07CPp/dGD0zXbgoCnN6P1aMa15FTNw92qgl6eiOgE=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB4071.prod.exchangelabs.com (2603:10b6:a03:56::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21; Tue, 4 May 2021 01:45:35 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::b5ad:a41e:d884:41d6%7]) with mapi id 15.20.4065.037; Tue, 4 May 2021
 01:45:35 +0000
Subject: Re: Request to create ampere-platform-mgmt and ampere-ipmi-oem repos
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <38d1440f-b3be-9147-5002-42536117e1e0@os.amperecomputing.com>
 <20210503143347.gncdsonvtqzpfmdo@thinkpad.fuzziesquirrel.com>
From: Thang Nguyen <thang@os.amperecomputing.com>
Message-ID: <5b08336c-89f5-31f7-4b9b-f71c603002f9@os.amperecomputing.com>
Date: Tue, 4 May 2021 08:45:28 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
In-Reply-To: <20210503143347.gncdsonvtqzpfmdo@thinkpad.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [1.53.112.237]
X-ClientProxiedBy: CY4PR16CA0024.namprd16.prod.outlook.com
 (2603:10b6:903:102::34) To BYAPR01MB4678.prod.exchangelabs.com
 (2603:10b6:a03:88::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from HCM-FVFX4014HV2J.local (1.53.112.237) by
 CY4PR16CA0024.namprd16.prod.outlook.com (2603:10b6:903:102::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend
 Transport; Tue, 4 May 2021 01:45:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a14b2212-559f-4c96-3dfa-08d90e9e4f45
X-MS-TrafficTypeDiagnostic: BYAPR01MB4071:
X-Microsoft-Antispam-PRVS: <BYAPR01MB4071B36C5D8EE9C21CA653C08D5A9@BYAPR01MB4071.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ujFaZiKmDUN9KcQjKm1+dey1K0paZrrQFDoA94pRr1I/ON/CD6QJGxufWzDX7vPXygXmfEnodP96jghmpO2J/JZx2Re/3F6tX07hYcugDIu81qf7ZRJhTKYo9Dr6sLTn5XmxF85/nniakwl2H1d0JqoDU/vUovDF4lNi2CWA1LGweyiZCL+PRnWQ7++qNRDXJIxeCoXyKQTAakW12HxsGqnk7a2oY9b9RNQW6qVAYwR6dDD2+4F7mvHqdR20WhqDt+RxEGPL74WjoiKE691eiSKct7QEWt2UBMrM5uxLhD+nfVTGK59NxEc4EAHpdlAnSeLZ5Affwl8sQFTCYIIXud3mZLbW0d6xPgUOfvUp7eCeoXqGW2MnFHKe1U6I5EY7RfZ7bHwgs0Gp09a9l79pykIxOcIuFKpISjvuUcx8yaTq3Fyj2EheqxyjfBM47LA0DtMCGd6gS5XatCI78l0L6vj4GPP4dklYd/8GoXDqJGaSWzQtVxR8+RZPi+Oh3UDC28velCO7G+Y3PcErtvPWeIHvhEvLWHGFU51nuCfLoO13L0mk2a+zafSCXbiquwID+HEmRwUCEA7O0I/G2wwAirttmgQVrAqagtRheqcLcre+PyDnolsgrhOnt2/wT1FSYP0+Ex2tLQrTIXYULODpHobCnd8NLgiyhLLkOObQTzaqq0w96SkYB2kDQbqKIpdj9K8U0ucDjR5d363iDozRzLixDC+JDFj6z5rhIZ1EFH5zE9ZLIRXO/z2oj6FhrwH8DevAi5/oy/MLAQlPUxZqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39850400004)(396003)(346002)(4326008)(6486002)(6506007)(16526019)(316002)(31696002)(4744005)(38350700002)(186003)(53546011)(5660300002)(956004)(38100700002)(52116002)(6666004)(2616005)(478600001)(31686004)(6916009)(84040400003)(66556008)(8676002)(66476007)(26005)(86362001)(8936002)(2906002)(6512007)(66946007)(36456004)(45980500001)(43740500002)(42976004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QWdhYnJhNG8ya1Bwd1pDTzY5a1ZVdFQ1cTFHMUIycG5pVkVNTDl4c1ZhVkpO?=
 =?utf-8?B?cFI1WVRwUU5mTEJudm1FSDJ1NWc0MDBJdWlXYnlKcDQ2QkJEVTZic3RmRkI0?=
 =?utf-8?B?M2tjV1FMTUhIMzIzaTZFZGdnKzYySW1Nc3dySVFvZzVwYUFKenNMdWdFbWRT?=
 =?utf-8?B?ZHpsMVR0VzMxdkZBUlVrWFM4RGJ3RFhsdW1FZmREaFFRaTkrUEllLzY5bHBE?=
 =?utf-8?B?K1hKVnM5TjVrU0E4ZnNOamtPQkdKSzdBblllM00vbVhQNjJxd2NwMXpqTW1G?=
 =?utf-8?B?Z2pjRURKL2ZUMWhlaVFlNjZ3YkJlTUVTU1Y4WEc4ZlVyV3U1SmRYREpLYjFV?=
 =?utf-8?B?VG9WbHJDY2pMQ1ArSW5EQU5HclhzSTlKYVBpd01LN0VSUFVTOGIvN3BRRzA3?=
 =?utf-8?B?WlpsSFp4N1ZqZWRMOVdkQXIvbG5mbnVhd0loa1VVemxRZTFaZnZ4dnVWTGsy?=
 =?utf-8?B?L0kzTkF6VlhEOTF1STlGaVlUSlFLQmhMdXJaY0JjSzlBVUgwRHZjTGVTZnpX?=
 =?utf-8?B?UHpaTStUTlBIK004ZWF5YVFkNzRkenFreWN6SHdPbjJMZ2FRNC9hUDQ5WFl2?=
 =?utf-8?B?alpnd094Z2s3L1EvUzZvb2hDYWpiRWVkVzJFZGZFK2VnelJneHV5V0l2eXNV?=
 =?utf-8?B?UGh2NkFFSnNacmVoV3AyTlJNOWlBZTJVMDVobEE4ZTFXYXczNUdTNnI1WklQ?=
 =?utf-8?B?Y1R0dVZsbnp5QjZIQ2FMeXBzWENzZkdoZUZManluN0U2QWZUQ1RXeGZaekda?=
 =?utf-8?B?Sy84dnliYXIrYmVmWGFVcWZ3dGdoTEJFVXh3SXpGR05wT3pqOHB0N0VYTDN5?=
 =?utf-8?B?d0xBV2QvTnBTUjlVQ05KWHUvYUZiNzBFZlZHYmxSK3RJNTl4ZWpNMVUrZ2lr?=
 =?utf-8?B?Y1NkWGJ5QzhoR29oa0JQL1dJM091NGtxbllHVm9EdHJyOGRVMmFxdmdvTUxs?=
 =?utf-8?B?bkg5dGxWWnkzNEVXZzF2Z1UxQ1VJWGtDNlB6amNkTVZBRHRVTGRLYnUrMlRO?=
 =?utf-8?B?VGpuS1NCYWFNWEIyYjR0bloxSmJKdDlOZmlHZjdWWGlZVmZEdUhCUEZFVTZl?=
 =?utf-8?B?dXlkTjlGdldRZGdkeWNPMnJrL29HMnBoVjB4dkVrdHJsbW9peUtMNXgxdXBw?=
 =?utf-8?B?bmJvSXFhUXZleEpnRmVrTGdHVmU2V05VUjhQc0xxZ1BveVYvS0t1cFlzcDB0?=
 =?utf-8?B?dHJ2NUdDQkNpdUNIYll5eWVkUVhZbTJ1ZVFiaVJvTytCMjFtc2RJNUhReGN6?=
 =?utf-8?B?UXFMaVU5VWs4Q2FUcE95Qk5iSVJ6U01nc2pZOTd3cXE3Q29kNWhub2NMWUhy?=
 =?utf-8?B?bmlUMEtybHUvcmV3b1g5cUlhWFJ0cVo0dHZKVlRUcHpRck1VSThuNDdnVmYz?=
 =?utf-8?B?Y3JkNUE3clhwMlRiRXRiMUsrcFhoNXk3MkhOMEJsNkFZYVMvQzhIempHdlY0?=
 =?utf-8?B?RFhhSUNQZG5VVzVXNDRyNE9kZ3B3blFKd0xaZk9aL2JjVElHZzhzZEE5M2Y0?=
 =?utf-8?B?TFBiM2FDbloxLys5MGk2TytPeU1VS1FWbllPRFVzV21vL3JJcFR0a2UwVW0r?=
 =?utf-8?B?Z3V4VmNQUXBKSm1KNGFTaHZoR0dZdkN4ZUlqcFVqa1EwVk1uaHNYa1dlTGtS?=
 =?utf-8?B?cXZYS3dRM2x5MWVlejZxSVdaS25xWTkwUlZmRDdoT1FDbGI5TlJuN2x5Y0hG?=
 =?utf-8?B?a3BJQ0pDSksrdEprZUdhT1RxQXhZR29oZmR3ZmNLQlNUUlhlenFMVW54dFJP?=
 =?utf-8?Q?XvoNcrquLAaatUN6B8qrPvJWxyHUbbw0AouaNR4?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a14b2212-559f-4c96-3dfa-08d90e9e4f45
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 01:45:34.9903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: toBRohPbjYaRFd8mm0D9WxAofeA1YdykG6Mjd3Ukj0tXR18IcIqqW+naJn+vleInTkG4TCBYtmsAn5D1OHVVusVSLo4I7oB86Ovd7BkMWPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4071
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


On 03/05/2021 21:33, Brad Bishop wrote:
> On Fri, Apr 16, 2021 at 09:05:36AM +0700, Thang Nguyen wrote:
>> Hi Brad,
>>
>> Can you help create 2 new repositories for Ampere specific codes:
>>
>> - ampere-platform-mgmt: contains codes for Ampere specific 
>> applications to monitor and control Ampere's Host like RAS error 
>> handling, Temp event, ...
>>
>> - ampere-ipmi-oem: contains codes for Ampere specific IPMI command 
>> support.
>
> ampere-ipmi-oem is ready for your use.
>
> thx - brad
Thanks Brad
