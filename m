Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4874AE329
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 22:59:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtcPB4gJ4z3bSx
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 08:59:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=LnbFQA57;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VT3sjhV/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=LnbFQA57; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=VT3sjhV/; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtcNn5vxkz2xtv
 for <openbmc@lists.ozlabs.org>; Wed,  9 Feb 2022 08:59:21 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 8DE6E32022DD;
 Tue,  8 Feb 2022 16:59:18 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Tue, 08 Feb 2022 16:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=KtC6OvDoJPOFLA3YJ0hbDbPnIlwDRVSnM7C5O7
 Edpwo=; b=LnbFQA57jz1Bl9imG/rSQnn0QEnR8brIp2gFVte1GB1otIvpxCEzfT
 v8eFX1odXiSn3vRqOSqZzcd8bwvNU4buo55j2DqvT/3/bUeqppvTa+wWlzmehM8U
 XaP05IcgY4ArcODq/65TSTvvCLvdPepxPtgJ5ZlblND3WwNo/3mNDl3Sehs9t07n
 Ud8LHgA6k1zsUAXYwI3Nuyaw1m05yhGNLxBpqdnSMJhX7nPvbt8W6rWcCM2GVpj4
 lW5qR1jM4WbUBkCCfQ6vqTiDjFbDspryQvDLtbPwoeeTZu0nRfIH9NQjVS7sAtZc
 HHZ7h0tld8DlNRD6cqlXt/pUTbeCkn1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KtC6OvDoJPOFLA3YJ
 0hbDbPnIlwDRVSnM7C5O7Edpwo=; b=VT3sjhV/wdq/qUD3Ol8Xgo25XE8o3TOpF
 SPSfKL4nvIVoViUGN8h04VH57afpaLCpDvrVYXflZX3pHAP6oBR3DBptbNMEDaBj
 z4HOXHdmnkuBKe/ttbaKaBsyX/6Tf78gzIRJ5UABbEWImuZ7ST5K82dy2NDOk+Hx
 P9sV+IfIEHjWf7DrDi0PNE9m3UWPCpUNaV2Psbr206h9V5fsn5oAbn5FNvILLm+5
 b/otNHQyG76sRQcd+P/j2W9pgcy6OCNiHJG3Ta4acqal7Kqm2ds97y1xQ0wW7Ai3
 G1LZfDHhGIQqFooqDkfA7ecOhbE9hX1VZjyMoEXqcZAkqc6kPCGDQ==
X-ME-Sender: <xms:tecCYqsyVComKHz61-8cDFKDXoXRRNX526Vt6zzPYwENFwLk4z7BcA>
 <xme:tecCYvdQ-fLYUVQBVaZxRNIOwYfbK3DIogK6kENjrboyTD9H_Rg3HdEQnp1IkuQlx
 zrC-leisqbFbaUt0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheejgdduhedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:tecCYly7-T8YgwSIHWPp48Dv8IpQMi5dValBCiUbWRQlNq9E8Q0Brg>
 <xmx:tecCYlPaXGEgMNa0SCXrK2Vy6JLN65SFoAAvDY2Ber0U8N3etLsaLg>
 <xmx:tecCYq9Ld1t2TsFz0Q6MRs5awg7GzFLS30rCBF4KtCvPCqpFUWKLmg>
 <xmx:tucCYvFnKLvqDC9ZhaqelTWSH8rlp7UE3Ivi5wrm5J3Y5v-r_jPDTg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7A2941920084; Tue,  8 Feb 2022 16:59:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4748-g31a5b5f50e-fm-cal2020-20220204.001-g31a5b5f5
Mime-Version: 1.0
Message-Id: <49472ed5-6989-4650-9c61-d609b2dae8ee@www.fastmail.com>
In-Reply-To: <CACPK8XcY=afrQ9bE2A3q1tC8Hhxmx3oVM7k_C_fVoYGbLJ4OUg@mail.gmail.com>
References: <20220131012538.73021-1-andrew@aj.id.au>
 <20220131012538.73021-3-andrew@aj.id.au>
 <CACPK8XcY=afrQ9bE2A3q1tC8Hhxmx3oVM7k_C_fVoYGbLJ4OUg@mail.gmail.com>
Date: Wed, 09 Feb 2022 08:28:53 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/6] image: Control FIT
 uImage signature verification at runtime
Content-Type: text/plain
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 8 Feb 2022, at 16:33, Joel Stanley wrote:
> On Mon, 31 Jan 2022 at 01:26, Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> Some platform designs include support for disabling secure-boot via a
>> jumper on the board. Sometimes this control can be separate from the
>> mechanism enabling the root-of-trust for the platform. Add support for
>> this latter scenario by allowing boards to implement
>> board_fit_image_require_verfied(), which is then invoked in the usual
>> FIT verification paths.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  Kconfig            |  9 +++++++++
>>  common/image-fit.c | 17 +++++++++++++++--
>>  include/image.h    |  9 +++++++++
>>  3 files changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/Kconfig b/Kconfig
>> index c3dfa8de47c8..11f796035ae4 100644
>> --- a/Kconfig
>> +++ b/Kconfig
>> @@ -322,6 +322,15 @@ config FIT_SIGNATURE
>>           format support in this case, enable it using
>>           CONFIG_IMAGE_FORMAT_LEGACY.
>>
>> +if FIT_SIGNATURE
>> +config FIT_RUNTIME_SIGNATURE
>> +       bool "Control verification of FIT uImages at runtime"
>
> Can you follow the pattern of the other FIT_ options by making this
> depends on FIT_SIGNATURE?

Yeah, I didn't think about this enough :)

>
>> +       help
>> +         This option allows board support to disable verification of
>> +         signatures at runtime, for example through the state of a GPIO.
>> +endif # FIT_SIGNATURE
>> +
>> +
>>  config FIT_SIGNATURE_MAX_SIZE
>>         hex "Max size of signed FIT structures"
>>         depends on FIT_SIGNATURE
>> diff --git a/common/image-fit.c b/common/image-fit.c
>> index 3c8667f93de2..eb1e66b02b68 100644
>> --- a/common/image-fit.c
>> +++ b/common/image-fit.c
>> @@ -1199,6 +1199,14 @@ static int fit_image_check_hash(const void *fit, int noffset, const void *data,
>>         return 0;
>>  }
>>
>> +#ifndef __weak
>> +#define __weak
>> +#endif
>
> Shouldn't we always get this from linux/compiler.h?

I'll think about this some more as this file gets linked into the tools as well as the firmware.

But probably.

>
>> +__weak int board_fit_image_require_verified(void)
>> +{
>> +       return 1;
>> +}
>> +
>>  int fit_image_verify_with_data(const void *fit, int image_noffset,
>>                                const void *data, size_t size)
>>  {
>> @@ -1209,6 +1217,7 @@ int fit_image_verify_with_data(const void *fit, int image_noffset,
>>
>>         /* Verify all required signatures */
>>         if (IMAGE_ENABLE_VERIFY &&
>> +           fit_image_require_verified() &&
>>             fit_image_verify_required_sigs(fit, image_noffset, data, size,
>>                                            gd_fdt_blob(), &verify_all)) {
>>                 err_msg = "Unable to verify required signature";
>> @@ -1230,7 +1239,9 @@ int fit_image_verify_with_data(const void *fit, int image_noffset,
>>                                                  &err_msg))
>>                                 goto error;
>>                         puts("+ ");
>> -               } else if (IMAGE_ENABLE_VERIFY && verify_all &&
>> +               } else if (IMAGE_ENABLE_VERIFY &&
>> +                               fit_image_require_verified() &&
>> +                               verify_all &&
>
> reading through this it's quite confusing.
>
> We have IMAGE_ENABLE_VERIFY, a compile time constant that will be true
> if CONFIG_FIT_SIGNATURE is enabled.
>
> We're adding a function that will override this.
>
> So we could have a function:
>
> __weak bool fit_enable_verification(void)
> {
>    return IMAGE_ENABLE_VERIFY;
> }
>
> The downside of this would be if a board were to implement this but
> not have FIT_SIGNATURE enabled then they could return true when they
> shouldn't. You could go back to this:
>
> static bool fit_enable_verification(void)
> {
>    return IMAGE_ENABLE_VERIFY && board_fit_image_require_verified();
> }
>
> And drop the ifdefs from image.h

This sounds attractive, let me poke at it.

Thanks for thinking about it.

Andrew
