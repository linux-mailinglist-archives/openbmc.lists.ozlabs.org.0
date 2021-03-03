Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E529832B9A2
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 18:56:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrM9s5hgJz3cy4
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 04:56:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=KlMSCAaO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:fe5a::817;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=KlMSCAaO; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn20817.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::817])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrM9b1hM8z30N6
 for <openbmc@lists.ozlabs.org>; Thu,  4 Mar 2021 04:55:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JA/2929G+Qe6Alswisb0w+W55njrr3OyymWvfTxJZV3yWcfCuMHZVJSBLrXHGqMw1vGLWr09TI31xeRrBt1G8gbhXgrrVnfiAYCII3h4lfqWj4XX4xZLg28ebjq2GbOprlqaQisdZY0geG02zt9TCs8I+MHgaA6cBNf+UupaY0V+Cubu9aIy4UIrMpPaoq3vVZfHePN/2/KQAIIM6q1QgO1RSmAo+a4zZdEQ1vvv3JD+IcNXfudEkI+mBcK+EWEHzCaZ8wWds42Jd47ugrF6bxKvX7KDFEf8W30tNxU2gq4PpoldOJ/Rmb/c7g24irL7bIWwWEWCFw8s56J0L1dhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0U8T1S9jjt4hHZ2FVzOp++GOpkCPPHbLP/xPFnOi+Tw=;
 b=HY0mQBYfv84ndOz7dvlNB13zJAfj47BlVbWYYDRA4alGvRTz32IEdyqpBwhLvaLwprZrhHcrynBGsIzMWoPXyeFfOMrr5ZPavtmjDwnHVjyEZipeYB3z+ArApmY8bQBjoW2tv2hQvdz5Vd2rNefAmogjG5Yiap0vQ90+r1R9tXi0RgLsFlmAf94oga6SpAZ9lBpzf/vn7GhvRxOvaF19weD2pQj3UOvT4woxkyWlwoETeRFMl7FMuumVEOKdxkEbZya7cyUW+Z0++GNSfTcKaUyCwEDyVGQhop2FB4ZGeGTTMN/rGC9w2l9n6V6R1rUbIZAxUuO6z767LgCoqstuYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0U8T1S9jjt4hHZ2FVzOp++GOpkCPPHbLP/xPFnOi+Tw=;
 b=KlMSCAaOAQCzWTAJkX1uJ5vF7c9xEL3BENXdUUa9enPBEGz0N+k3ePsOIrR/amaZt1H5r80zoVoNJdWICKevMix3xgaAg1VXAIPbgA0A64fdtki1UXgkXIWLOp5gve4QM66H084JO1d9B2CraJnc+aQ5IqqXIQM4nuLKQlfSVWZUEsgDeZj6xwnoTKiWgBrdnXqB+ugePEJEXiDRXOV4AjRRVTLlfMfOiKthvIUBEpF/Hv3pAA2l/m7upeZZzLKbiX+A5oJuA7Gt+d+9VDytyGOAP3fCJg2nBlRsaKzkbVgj8Dyt0CSuG4I7EN7o+on0V1yFfTd7zDT44vn1NahvXg==
Received: from MW2NAM12FT061.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc65::4c) by
 MW2NAM12HT161.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc65::462)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.11; Wed, 3 Mar
 2021 17:55:34 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:fc65::45) by MW2NAM12FT061.mail.protection.outlook.com
 (2a01:111:e400:fc65::509) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend
 Transport; Wed, 3 Mar 2021 17:55:34 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DADCD9C38D14FF6A9663CF4830285FE9F342309657234586F06768F823A6FC56;
 UpperCasedChecksum:81D2BA5AE3996DDF73FB0C9DEC7F860EA99BDD7360E55361A11211A9FC7F284C;
 SizeAsReceived:8071; Count:47
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::5d98:ad3a:8911:84b6]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::5d98:ad3a:8911:84b6%7]) with mapi id 15.20.3890.030; Wed, 3 Mar 2021
 17:55:33 +0000
Subject: Re: overlayFS security concern - threat model
To: Joseph Reynolds <jrey@linux.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "chunhui.jia" <chunhui.jia@linux.intel.com>, Andrew Jeffery
 <andrew@aj.id.au>, Patrick Williams <patrick@stwcx.xyz>,
 Michael Richardson <mcr@sandelman.ca>
References: <BYAPR14MB23420BA1183F22A48EF8B97ACF839@BYAPR14MB2342.namprd14.prod.outlook.com>
 <fc76b6b2-5231-da28-cfb4-d591e1797732@linux.ibm.com>
From: Kun Zhao <zkxz@hotmail.com>
Message-ID: <BYAPR14MB2342DF41E889D2E05209A2BEDC989@BYAPR14MB2342.namprd14.prod.outlook.com>
Date: Wed, 3 Mar 2021 09:55:32 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <fc76b6b2-5231-da28-cfb4-d591e1797732@linux.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TMN: [CfEYS2XXj4XtDsyw2nQgzd6AZdbJSnxy]
X-ClientProxiedBy: SJ0PR05CA0171.namprd05.prod.outlook.com
 (2603:10b6:a03:339::26) To BYAPR14MB2342.namprd14.prod.outlook.com
 (2603:10b6:a02:b8::22)
X-Microsoft-Original-Message-ID: <6c95ab9c-3998-c77f-b237-1cb6d31b9616@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.31.135] (76.126.242.124) by
 SJ0PR05CA0171.namprd05.prod.outlook.com (2603:10b6:a03:339::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend
 Transport; Wed, 3 Mar 2021 17:55:33 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4c715219-1949-469f-61ab-08d8de6d8ad8
X-MS-TrafficTypeDiagnostic: MW2NAM12HT161:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IaG6WJxwemEZU5dpcv6f6oANH7XEZFSzsVsB2S8wudLxMps/ck3LU6PDFvWD39aT/OOhKESApNPktK6RzPDF7O+iCO7VxzFSqKPaibaNN9boW24X5UJ/DgIDj+ib6JN+PV9SLmakQMnsIBCXzQxDm3GIyZDt74BOcQ+QdtvxO73DUAHiHPg+s9oswb+u/hlFYZw/ZweijWAGGg8VPRv++GQ3Fx4eN6wMt2ZnMb3SeU3eDHmItRoTwVgigk4JZOfaIuLb+v86vCqTlzKAmTcCIyE0yDe9XjO9zoCfXfW35TIy0il1so1nr/Dc3A3tXla1Dnk5UBSypFTVNOKs/SfofAMLiv/k14YG/As0f/SJqtFS8kYvvOS2V33PyLsJQIhI7NlNfcceO/hvBsRYwBKUqCx0ZEpMYnjWiSo0q3ULw5M=
X-MS-Exchange-AntiSpam-MessageData: iFzCNkfbLVjxUrrW0fvZFwdx8n7q/aDjZAibLCNVw0OY3XfQAjqZoNwbLpNV4u7g+HqjaqNfQzLOvknCpZSG83ik+Azp6wAPXNQayd4S5irKjq7LzjHJQ6FNm79XVt+HQ+EDAJLB1XSL9FtInjAj9w==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c715219-1949-469f-61ab-08d8de6d8ad8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 17:55:33.8991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT061.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2NAM12HT161
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

Thanks, Joseph. Seems we have several options to solve the problem.

Kun

On 2/22/2021 9:36 AM, Joseph Reynolds wrote:
> On 2/19/21 6:31 PM, Kun Zhao wrote:
>> Hi Team, Have the following case ever been discussed before?,...
>> This Message Is From an External Sender
>> This message came from outside your organization.
>>
>> Hi Team,
>>
>> Have the following case ever been discussed before?,
>>
>> Anyone knows the root password will be able to let bmc run their own 
>> code by scp the code into bmc with the same file path as any services 
>> in rootfs. It will make the secure boot totally useless.
>>
>> So besides,
>>
>> 1. disable scp (but scp is one of the firmware upload way)
>>
>> 2. don’t use overlayFS (but it’s really useful for debugging during 
>> develop, and configuration management)
>>
>> Any other solutions?
>>
>
> Kun,
>
> Thanks for starting this thread.  Good discussion everyone!  Note 
> OpenBMC's SSH interfaces are described in 
> [network-security-considerations][].
>
> I would like to improve the project's threat model to cover these 
> ideas and so propose a new document, threat-model-considerations.md, 
> to go under [OpenBMC security docs][] with topics:
>
> - OpenBMC has a well-known password.
>     - Explanation: OpenBMC has a well-known root password.  There is 
> no mechanism which forces anyone to change it.
>     - Risk: OpenBMC's default configuration produce firmware which has 
> a well-known password which allows an attacker to gain full access to 
> BMC internals.
>     - Recommendation: Three independent recommendations:
>         1. Provide a [configuration guide][] for firmware builders 
> which instructs them to change the default password for their distro, 
> and similar for BMC administrators which instructs them to change the 
> default password when they first access the BMC.
>         2. Implement an image option to cause the BMC's initial 
> password to be expired so it must be changed before access is granted.
>         3. Move away from password-based authentication.
>     - Caveat: The expired password solution leaves a time window when 
> the BMC is available to attackers and has well known password.
>
> - Root account login to the BMC's command shell.
>     - Explanation: Root access to the BMC's command shell is required 
> for developers and service personnel to do their job. (They need to 
> access the BMC internal tools and interfaces.)  But root access is not 
> needed for any administrators or users performing normal BMC functions.
>     - Risk: Users will have more authority than they need to do their 
> job.  (The BMC should be designed so the owner can give each user the 
> authority they nee, but no more.)  Additional authority may allow a 
> user or attacker to damage BMC internals or gain information about the 
> host they are not intended to have.
>     - Recommendation: Disable root access in production images. 
> (Should we have an OpenBMC image feature to control this?)  If root 
> access is no disabled, it must be strictly limited to authorized users.
>
> - SSH access to the BMC (including scp firmware update).
>     - Explanation: The BMC provides an SSH server to allow secure 
> shell (ssh) sessions to the BMC's command shell, ssh sessions to the 
> host console, and scp-based firmware update.
>     - Risk: See the "Root account login to the BMC's command shell" 
> topic.  Note that ssh access to the host console is intended.
>     - Recommendation: As above, disable SSH access for production 
> images.  Disable SCP and instead use Redfish firmware update.
>
> - Running unintended code on the BMC.
>     - Explanation: The BMC is intended as a closed appliance but runs 
> Linux.
>     - Risk: The BMC's Linux capabilities allow an attacker who gains 
> access to the BMC to attack the BMC's network and attack the BMC's host.
>     - Recommendation: Use technologies like SecureBoot and Integrity 
> Measurement Architecture (IMA).
>     - Caveats: Powerful scripting tools such as the command shell (sh 
> or bash) would be allowed by IMA to run on the BMC but still give an 
> attacker the ability to run harmful code.
>
> - Having writable portions of the BMC's file system
>     - Explanation: The BMC is intended as a closed appliance with a 
> read-only file system but has a writable portions of the file system 
> to store BMC admin-configurable items, firmware updates, internal and 
> host logs, etc.
>     - Risk: The BMC's writable file system allows an attacker who 
> gains access to the BMC to make their access permanent by writing to 
> the BMC's file system.
>     - Recommendation: Strictly limit which portions of the BMC's file 
> system are writable.  For example, to /var, /run, and a strict subset 
> of /etc.  Use a non-persistent overlay for data that does not need to 
> persist beyond a BMC reboot.
>
> I've added this topic to the [OpenBMC security working group 
> agenda][].  But please keep the discussion going in the email list.
>
> Thanks!
> -Joseph
>
> [network-security-considerations]: 
> https://github.com/openbmc/docs/blob/master/security/network-security-considerations.md
> [OpenBMC security docs]: 
> https://github.com/openbmc/docs/blob/master/security
> [configuration guide]: 
> https://github.com/openbmc/openbmc/wiki/Configuration-guide
> [OpenBMC security working group agenda]: 
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI 
>
>
>>
>> Thanks.
>>
>> Kun
>>
>
