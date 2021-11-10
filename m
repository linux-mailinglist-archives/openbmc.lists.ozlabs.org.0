Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B5A44BCCB
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 09:24:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpyZQ6Tj3z2yQC
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 19:24:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=s2 header.b=dTB8q1sl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xs4all.nl (client-ip=2001:888:0:108::2c;
 helo=lb2-smtp-cloud9.xs4all.net; envelope-from=hverkuil@xs4all.nl;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=s2
 header.b=dTB8q1sl; dkim-atps=neutral
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [IPv6:2001:888:0:108::2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpyYw64ZNz2yNC;
 Wed, 10 Nov 2021 19:24:16 +1100 (AEDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id kithmlZONfwDFkitkmFH2X; Wed, 10 Nov 2021 09:24:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1636532645; bh=BcUVA9s8ZJy+4O1jwipqD5yXI4l2XH+GCSbhqDCosdw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=dTB8q1sl3OhvQ2TG0q80dfbi15TtxAoOgon7cVeYvAR1byBH1qNZPxN6HQBwI7F6+
 lGnPafAJ3TKq5s4+XNVIheq/yhnpeC6iNUrgTASIkKLWLdgtcCDZpGiibgRdCdmy8F
 ezDpH6Abgjqcc2EuIoNXXEiXqeYnIjYzhNPQDrNiMmnOMKST/MqLnGLrVb5y4hQ7oq
 2It37F30E9nV20uZs+H/yoXH0yaD3jAJCQVu6uvgHyWhi6ybeKsLebjC2FaRXd4bdN
 JSvEXxzcqSEKZ7ZYt2ucocFneP4Nr5s39oYJkcNoEX90puYLnRCBomV20zTeTokIq5
 Be9tYLZR297qA==
Subject: Re: [PATCH v3 5/7] media: aspeed: Support aspeed mode to reduce
 compressed data
To: Jammy Huang <jammy_huang@aspeedtech.com>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20211022065539.12392-1-jammy_huang@aspeedtech.com>
 <20211022065539.12392-6-jammy_huang@aspeedtech.com>
 <75ea5824-e241-6548-bdc2-7ac9ec6346b6@xs4all.nl>
 <7d6ced4a-fea1-1163-40cb-65b4ea929a51@aspeedtech.com>
 <34ce1814-349b-d7a9-6118-341eea9ecf5f@xs4all.nl>
 <fb546475-8e61-b847-67c4-466dee57b318@aspeedtech.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f62d9fce-cb0b-42f2-ff69-71e79dcd51a2@xs4all.nl>
Date: Wed, 10 Nov 2021 09:23:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <fb546475-8e61-b847-67c4-466dee57b318@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLouZZIVOHH2IEWkESGsSZ/L0X4GAeYl2HwMKD4Ftc52FZnMJAwj0Dzl+SLxci9cPR1ZWjYzYc216FINXx0YqSFY0SF8edPQvP2dK5GwtVcZdjFljfT8
 ywHJhW4yRAXi6IhWquTM9YedVS030x25r1F0LdTqzaPGQGK/FgQXg3bmVWfBP1jUwEdrOxG4sory5ltMwRhqIH2iubIKFbMrKdA36Gpqsc45R4Fz/efW8OAt
 f6OCgsCR+wLuyweTgDGW5/9itDGzLQmAhgwfTMqINt5LKNpMkxVpxeguchYnmoOb0ouLwnL+51OgIh00tX69WGFLawkjGAO2XwQE7JORe/5mjYfvLgaWS9dG
 qdOjd6Tj71b9ZQHasixuZEWNK9zCbpDN7kj5AcHqsf8Jl6jdLz5eEq2oLNJCxN7sPrdyeNEZ8X3yZbEV59K3KDl2kE4By/HxzHGGRgXoD3U7wMXirmIzgNED
 2/Iw/aRqDctKNsdX15TNciPNVKNuZohAOyT21WG3eFoeVyDzW1tp+dO9Xis=
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

On 10/11/2021 03:40, Jammy Huang wrote:
> Dear Hans,
> 
> On 2021/11/9 下午 06:17, Hans Verkuil wrote:
>> On 11/9/21 2:56 AM, Jammy Huang wrote:
>>> Dear Hans,
>>>
>>> Thanks for your review.
>>>
>>> On 2021/11/8 下午 05:09, Hans Verkuil wrote:
>>>> On 22/10/2021 08:55, Jammy Huang wrote:
>>>>> aspeed supports differential jpeg format which only compress the parts
>>>>> which are changed. In this way, it reduces both the amount of data to be
>>>>> transferred by network and those to be decoded on the client side.
>>>>>
>>>>> 4 new ctrls are added:
>>>>> * Aspeed JPEG Format: to control aspeed's partial jpeg on/off
>>>>>     0: standard jpeg, 1: aspeed jpeg
>>>> What exactly is 'aspeed jpeg'?
>>> 'aspeed jpeg' is aspeed proprietary compression format. It will compare
>>> the new frame
>>> with previous one to decide which macroblock's data is changed, and only
>>> the changed
>>> macroblock will be compressed. In this way, the amount of compressed data is
>>> significantly reduced. This is similar to the concept of I/P-frames of
>>> video compression.
>> Right, but that makes this a new vendor-specific pixelformat, not a control.
> OK, I will add a new vendor-specific pixelformat for this.
>>
>>> For example, the video is static in first 3 frames and then a object in
>>> the video moved in
>>> 4th frame.
>>>
>>>           Frame Content      |    Standard    |    Aspeed
>>> -----------------------------------------------------------------------
>>> 1th                                 |    Full             | Full
>>> 2th    identical with 1st   |    Full             |   none (only about
>>> 12 Bytes for header data)
>>> 3th    identical with 1st   |    Full             |   none
>>> 4th    a object moved     |    Full             |   Only the Macroblocks
>>> that have data changed are compressed
>>>
>>> I have implemented a javascript aspeed decoder in novnc to support this
>>> format, but
>>> the performance isn't good enough. I am working on a web-assembly to
>>> improve it.
>> Is this format documented in a datasheet or something similar, ideally freely
>> available?
> This format is documented in ast2400/2500/2600's datasheet, but it's not 
> freely available.

OK. Make sure to document the new pixelformat in
Documentation/userspace-api/media/v4l/pixfmt-reserved.rst with a reference to where it
is defined in the datasheet.

If there is publicly available source code that converts it to 'normal' JPEG, then
a reference to that would be very nice as well.

>>
>>>>> * Aspeed Compression Mode: to control aspeed's compression mode
>>>>>     0: DCT Only, 1: DCT VQ mix 2-color, 2: DCT VQ mix 4-color
>>>>>     This is AST2400 only. It will adapt JPEG or VQ encoding method according
>>>>>     to the context automatically.
>>>> What exactly does this do?
>>>>
>>>> Is this very aspeed-specific, or could this be a standard JPEG control?
>>> Yes, this is aspeed-specific. Its compression algorithm is a modified
>>> JPEG algorithm.
>> Is this specific to the aspeed jpeg format, or also to the 'regular' jpeg format?
> 
> It's specific to the aspeed jpeg format. Regular jpeg is based on DCT 
> and doesn't support VQ
> compression

OK, that makes it an aspeed-specific control. Good to know.

Regards,

	Hans
