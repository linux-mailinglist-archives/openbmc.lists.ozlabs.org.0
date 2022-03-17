Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC334DD2D2
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:10:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKSCY0M4lz2xTq
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:10:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.a=rsa-sha256 header.s=selector1 header.b=N7jtROSc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=prodrive-technologies.com
 (client-ip=2a01:111:f400:7e1a::715;
 helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=govert.overgaauw@prodrive-technologies.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prodrive-technologies.com
 header.i=@prodrive-technologies.com header.a=rsa-sha256 header.s=selector1
 header.b=N7jtROSc; dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::715])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKBHX1W2Lz30Df
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 02:43:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KU1NaHhiajkibkZnOxwHT8TsB0PPwzMN0CaD3l7Lr16g5s8sA6/UzRsYqsi+xFKMobkg7ZqMFLSCG4mLIhatak57pdCU606CyK0fyobQYFgR5VKLS2W/vH9SYWtyqX5iMXsYs6pPLnhikAkC/IAfElYjroOFlYE5yq7ECck67ze61C4KF320GjWOjGzCLcJIfYobwjtgXPVJz1lTM81i64vroRJXF3ep8NGkl7uJ0EXbxZB3EP6YNHInRrLq6urTX4ZMdGHihlzfxPYn2HV5UVd09cW1Iv4QIR9EvoZfhb/UY3fZ41DhavtWZ+SZEMZSMFAlu9XoL5bjzEuO9BerIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9f6hnNIpYDCtBis8weo+lYGbNoi7pHhI8SsykoQ2C0=;
 b=GzKeqGZV6QRn+c2vnQ4fe+Sdj9oMHLCcpJCxrxI9RyKrrs6FGf6dCYGfTYH/j1SB2ClWG+PwvGH07YgqdHQq+JMlbGVSJZU3KkSFNp/y0nok8J+gM9WkBjZCxHIxOTWPySaHSCSAOsrP3SSFS7NBlFO5ksTNhh3s5MNTAuskuKJT1+UnyG8+sKVOwSyR+E7687WjQy/jORRAkhM5MskUVZzu+K2CROCj5gyO3Rb2UXaZZ+y0p1rlsEmszT2Skcxe4xABBAcd8cNu6Q/pEqhCcEZg1oPTDDIWmyrzg/f9JaBjS2hxLZsMciKh97DMEXaZYRHP6F/pjbCV7+MA33KfFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prodrive-technologies.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9f6hnNIpYDCtBis8weo+lYGbNoi7pHhI8SsykoQ2C0=;
 b=N7jtROScvN1CjrWxbgVHTBNyWaInwOr0EujBbQAbIuLyrMHeHSvTjpHEI33h+F6dWC5z8jZO9N4jHaFxy48GwChhLvit1s9w/KdclY9p0iVcLqwnyca5oULMuZx9OOH2fluzKQPeplCiNj0o5vj9qAkzoeF3WvAPHhBcH0mCFm8=
Received: from AM9PR02MB6499.eurprd02.prod.outlook.com (2603:10a6:20b:2ce::16)
 by AM6PR02MB4422.eurprd02.prod.outlook.com (2603:10a6:20b:67::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 15:42:38 +0000
Received: from AM9PR02MB6499.eurprd02.prod.outlook.com
 ([fe80::5595:71b6:c5c5:9acf]) by AM9PR02MB6499.eurprd02.prod.outlook.com
 ([fe80::5595:71b6:c5c5:9acf%5]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 15:42:38 +0000
From: Govert Overgaauw <govert.overgaauw@prodrive-technologies.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: MCTP LPC FW binding
Thread-Topic: Re: MCTP LPC FW binding
Thread-Index: Adg6FUSgBupJSyQsSz6pbiYc/Xifzg==
Date: Thu, 17 Mar 2022 15:42:38 +0000
Message-ID: <AM9PR02MB64999E358D561C31D9B31060C1129@AM9PR02MB6499.eurprd02.prod.outlook.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prodrive-technologies.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dc2a65e-7922-40b9-42f2-08da082cc413
x-ms-traffictypediagnostic: AM6PR02MB4422:EE_
x-microsoft-antispam-prvs: <AM6PR02MB4422CC93515E54B6C2BAF045C1129@AM6PR02MB4422.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bmxyFoRX8vKINLIZm4fJoLYD92vAqOlWQ5K+5BpxrVYbLysxlqITRCqkwn012Y29+nCHUS4kk5DsFCsg6RntbIqnvnS5M1yQ2Y6et8DuVn1Cbe4pmbTX7IdpjvS/9nLC3Eh9cK71qEcRukjnnfsdHaTUoseOl2ShEC4NoWWF3GRXf7khV+Q+Z1SwHNY0x1aGJdgrn1Ima5j+nbkMV82T3G3zK67tsA60LJL1Fni02E/bpJGofv88w/NBj7hdnY9wtfLwOfyAIjWrVFS8153Az4+u7GIbze/rhsLfUqvu1Qbgjp7KwaP4/isYUwpDKh4jh7NBklXQc2oLxnVJSzKyDQi8YzXth75B6aL0rx1NWq9x0dzRPyVQXxJnlFN1iW+D9Ixk8ckdoTY9xL/7AxZl/dLB61uAdQoCSUKskhtbCQiNIaMLKzz8s9wy8QbWm9KZYb3c49FtniZEfelnE79XtCl8HX7yWLQk2W4C2+hYqdCrn9lvI+DYiA/ehSbxPl0q5oj8wmUuCh3Z8MB6LXbKO/3JkWmGu3WUP5hnAhgd0R4X8FzfN9I25wSAFISb5hQpN8owUHG+8uH/NB5Ndr1dKExNn0yOUb9Cq6pzYB2S1oVy49ihmoII/wMgOXM8HeT7tES9vPAx4e2bJRK2AHaYUR/zPbkZ1ifwqI5WoSk/nZoH7z1RfH8yWITY8ZiqDu43U5lYNPnuKJI/fAZFw/sePw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR02MB6499.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(71200400001)(64756008)(66446008)(44832011)(76116006)(66946007)(66476007)(66556008)(38070700005)(8936002)(33656002)(52536014)(5660300002)(508600001)(186003)(2906002)(26005)(9686003)(7696005)(55016003)(316002)(3480700007)(110136005)(6506007)(83380400001)(122000001)(8676002)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gNi1KI1BZj+7zth3liBEHd82ZenWzcHVlmA/O6GqVKjeKSWPuIm+ayQDqMhO?=
 =?us-ascii?Q?WXvOhxIQhUg6he4D4Zxr6H70Jro/sqTFLWcTnKsb4entCHGZgF/kZbh09+h9?=
 =?us-ascii?Q?QFUdDF6WoL/cRpRjKjRDJhxddkal//0TtsE+VsuLgVYnU66ReXcwKV81ab2L?=
 =?us-ascii?Q?Nih6BwSOswJr/3dz8GNhEtybzOWZZMCLb4fWKuHFjPcU1bH3X/Y7xS7+zgAX?=
 =?us-ascii?Q?l0a8SjuL0Y0FUpo69POLnDfhxFVcJs2qwbGwYtBnrwkQwQ9UF+XxI4JLy5xh?=
 =?us-ascii?Q?zyeU6FHZ1SEiHtq12JOmhJLBxON/8tpNmr1qTF5sqlbrrWMqmc8KUovbnEBH?=
 =?us-ascii?Q?hG74ajRHQlD99hYx/teiS5JdZ8rIgcH6TaJnoLgivEbebeBc+tJ2UpfiOfry?=
 =?us-ascii?Q?LtDKSCFvvVGHWpuR4fOUHzwTh5Fm2S6KJ+hfyii2+pwjw7EBu1+Dxrxo6KXL?=
 =?us-ascii?Q?z2Erbylou0ZxUA/k6NB+90ynv8Vga5/aAmDKGF+QgNhdNd0mhHRNO5KGtejH?=
 =?us-ascii?Q?BAvoBi66cXwl5cgL2iICdVZ63lqMjYQCp2pd3/zpynghAk5lxdxTZEvAM6sK?=
 =?us-ascii?Q?xOqSAealkeD8ex/etACOzWwzwkG+z6AP+BQEM3LLutGJCsrL4BaJqcjj4ey0?=
 =?us-ascii?Q?52Z+DRL4Ki/BS0FmJMDwwmsn98CVIkN1wHzB6ArJJAO04ji453nDtVNPOaBU?=
 =?us-ascii?Q?y0rNSIYhIwTjaMytsjaaGDSKiZHyQ/fbHPJt/Lt+Mcqf7JtCVci4dLIUC3aD?=
 =?us-ascii?Q?pXYtAVjqt0lQQyouqob6bJpcyCMj8bWpe7Mg+dzEx5aYmkdJBeD5y+VDxkB+?=
 =?us-ascii?Q?u1HpA97wyXWp+uH3c3h5i0Xm4wRqymPzcLMTIHf75t9cK22p4aGhI9vG+L2N?=
 =?us-ascii?Q?eZtnOTUuEoKfn6Abe0MjqdISQG9jNCx3+u9vGN527JOBeTGtwyiSDSPGZcwO?=
 =?us-ascii?Q?tjDgqHuGJQRMSksJvhwDx2Xrru4A4BHtbBT9sV6/Z0YdT4oiQxu1kzpxq1xR?=
 =?us-ascii?Q?NQAq0opJD8Y5jH6COO2u88cnN51eCSiXzIAqQX4iimbTRQjMRLKRdmCrXQHW?=
 =?us-ascii?Q?QCWiWgyaETmn27YvPw5LdSMGoziq+GfSxFZLYahzqRqSv44bOjrfR5mZqGCR?=
 =?us-ascii?Q?JgTOqmCr4uogI8iGXKVTnc6coj8dhaIhUu3PUaqY2FYBdNpP912fS8k2fYPO?=
 =?us-ascii?Q?Z5Na3LtsQYTsisP6Aq/9bglVXHMGAmj6GictY4GibgL1vIEr4uj/SNLHtFzj?=
 =?us-ascii?Q?Mga2hTH19kACkoCPY/eXiIuKFZ79k9vUBZjKCR6odyKxQZjg9xw84KM7qf/G?=
 =?us-ascii?Q?l98w3yHT5Lte/O5ZHi72uhpbZ7fE2aJ0L5i3NCN774AdJrpAchw3J0RMLZwV?=
 =?us-ascii?Q?cdIIz5kGQXsbfljyr7zXV7TYbjHgWK6pofltRdl87VgaPPRxF79C8xaHTG+B?=
 =?us-ascii?Q?4/Ak97UVPQSUfqyoF6Oy4eT+SL59isVFhYbpLTrrGc4pMtxgNPvJfVLrMM95?=
 =?us-ascii?Q?zMO3YAzQUnpe5jC0hG9y2qQyZqrEBLkHvSgL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB6499.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc2a65e-7922-40b9-42f2-08da082cc413
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 15:42:38.6276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kvJwOKeCQMbuv2cakCCCpSYdlxP/9mrMH/i/itwq+jOvtzJCR9c2Widae60mufF63dK5pB67vUL43+jmpUtA3woNblZ1N1tjlGEcN64u26tMTTIP7qvO2lUz/X1qR/8w5rrOJFwYpEKOoRZIozgvWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4422
X-Mailman-Approved-At: Fri, 18 Mar 2022 12:55:47 +1100
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

>> Hello,
>>
>> I was wondering if anyone is/was successful in using the MCTP over LPC=20
>> binding with an intel platform? I read through the documents, it seems=20
>> to me the binding was designed to use LPC firmware cycles. To me it is=20
>> unclear if the ast2500 supports memory cycles on the LPC2AHB bridge=20
>> (datasheet seems to list it in the features, not much explanation). =20
>> The problem is that the C620 chipset doesn't support firmware cycles=20
>> (only memory and I/O cycles). And having a properly mapped window in=20
>> the C620 chipset and reserved memory in Linux. Writing and Reading to=20
>> it only returns ('1s').
>>
>> Writing a simple test on x86 that keeps writing a value to the mapped=20
>> registers, seems to trigger LAD[3:1] =3D 0xF readout on the BMC LPC host=
=20
>> controller register 0 (that has some debug registers to see the state=20
>> of the LPC bus). 0xF is the stop frame of a standard LPC memory cycle.
>
> As one of the authors of the binding, I just wanted to note that it was=20
> developed for IBM's Power systems (which support FW cycles). I haven't=20
> tried memory cycles, however there are other conditions under which you=20
> might get 0xF, such as if the LPC2AHB isn't enabled. The BMC=20
> aspeed-lpc-ctrl kernel driver should take care of this for you, however=20
> it only does so once you open the character device. From there you'll=20
> need to use the ioctl()s to switch the bridge to use the reserved=20
> memory rather than the default mapping of the host SPI-NOR.
>
> Andrew

I can confirm that the BMC works with memory cycles on the LPC bus using th=
is binding. There was a misconfiguration on the x86 side resulting
in it not generating memory cycles on the bus.

Govert
