Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAB95F5F49
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 05:08:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjbwZ08YYz303D
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 14:07:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=UNh8dCTb;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=s6v8JOKh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=UNh8dCTb;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=s6v8JOKh;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjbvp4pTSz30hw;
	Thu,  6 Oct 2022 14:07:17 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 50B1632009B7;
	Wed,  5 Oct 2022 23:07:13 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 05 Oct 2022 23:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1665025632; x=1665112032; bh=D2A7KGl6Nx
	Nqwykh+AYiSj2aZjrv6WwosJ3tBKEWL9A=; b=UNh8dCTbt11+Y04xRIMeIQg+Q1
	6IS109m/KEqCRXHJZ0D0fapKfJagnxilV4OlZwYfLXpqbyfFU1PmALyDrlVI4jec
	+P0GaakUCl7jou5ZjBPx84ofanOdmTACKpOXf1i+s9tbxJumaVDWvNoGxDppxREM
	8kK7ydXJA2EoPRmk1R/tGvKj3hU8iA6iGSuTjg+855soTewPwltgKq+PwSKRqwOI
	ZC3mD62TvlMZeppksWRN0iCViyAP4WUTwuUugcJqmuvgJ1EyWEwwpyEyWprmth0L
	jwROxznY51PGj8OCWGh5iy4GSy220RKmN9qXANbZkNnjVhHERLe+g8jCxP6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1665025632; x=1665112032; bh=D2A7KGl6NxNqwykh+AYiSj2aZjrv
	6WwosJ3tBKEWL9A=; b=s6v8JOKhc6PogwG6nV+k5ipmlROWpjI5vzgQgqABWzAV
	AnJnbYVatK3HYrgyuDABlSjKK/s9ZkRq637ehv7szSZ5A3qD28RO5OcnK5ruOUeB
	/hLS7Iaff7ZVntV9AVYtXUs8buBgjUH4Rn2SKTdUeBEXGWi/GQlBUU4pLUdp7pVH
	7hTg+9S2eVOv5zpgrKJYC+Njlf1euCpgdqWONCyeSI1inkMXuIjZ0zOdbDEdgp0j
	STEuthh4M2u3MG8ZfmQh1tF/i9McO7sfijfz35Ze713GRJWavYhSOR2h3YVLqvf7
	5YdFaA01uy0XMtuRM9wnuGx0QqpMRtkUcSzlYinJbA==
X-ME-Sender: <xms:YEY-Y8UNtac18V-Hiexm9LASsU9iONfZzSsfNNb8DqGrCsO-f-Y0YQ>
    <xme:YEY-Ywn3B-LoAEKNrTi1VV3x4S0h2qtFyg0pEP8WzefqByUNmVpp-uTDQBPKF-o1s
    UFahTPlyWrUaSm8aQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeigedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:YEY-YwadAudAkAFsrZ_RbYcUEH1yQtse64xeP5r7Q2wNtpj8hKamQw>
    <xmx:YEY-Y7Wrm-9JAkglnGHqmFGF9c8pNvKd7n9dDO4wIp1rgCsoFBYEXQ>
    <xmx:YEY-Y2l-rF7H8u5FZrE1fWj7zjjyyxtZ9G1WmY8Erd_UnrJnCaqfOQ>
    <xmx:YEY-Y3BdZ9hZ8dnnoJtj_WDaSWBmzxxjRpnGeZM7k22Vj3bluiODGQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 58DF01700083; Wed,  5 Oct 2022 23:07:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1015-gaf7d526680-fm-20220929.001-gaf7d5266
Mime-Version: 1.0
Message-Id: <f6a85e5e-a3b1-4e5c-9db6-1222dcabd780@app.fastmail.com>
In-Reply-To:  <CACPK8XdnFPXZuzAaSMOUnV6ng9y2_ZMcAff12q8Zxvr2HJZy-w@mail.gmail.com>
References: <20220812144741.240315-1-andrew@aj.id.au>
 <CACPK8XdnFPXZuzAaSMOUnV6ng9y2_ZMcAff12q8Zxvr2HJZy-w@mail.gmail.com>
Date: Thu, 06 Oct 2022 13:36:51 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] ipmi: kcs: Poll OBF briefly to reduce OBE latency
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
Cc: Corey Minyard <minyard@acm.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 6 Oct 2022, at 10:20, Joel Stanley wrote:
> On Fri, 12 Aug 2022 at 14:48, Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> The ASPEED KCS devices don't provide a BMC-side interrupt for the host
>> reading the output data register (ODR). The act of the host reading ODR
>> clears the output buffer full (OBF) flag in the status register (STR),
>> informing the BMC it can transmit a subsequent byte.
>>
>> On the BMC side the KCS client must enable the OBE event *and* perform a
>> subsequent read of STR anyway to avoid races - the polling provides a
>> window for the host to read ODR if data was freshly written while
>> minimising BMC-side latency.
>>
>
> Fixes...?

Is it a fix though? It's definitely an *improvement* in behaviour, but 
the existing behaviour also wasn't *incorrect*, just kinda unfortunate 
under certain timings? Dunno. I'm probably splitting hairs.

In any case, if we do want a fixes line:

Fixes: 28651e6c4237 ("ipmi: kcs_bmc: Allow clients to control KCS IRQ state")

>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks!

>
>> ---
>>  drivers/char/ipmi/kcs_bmc_aspeed.c | 24 +++++++++++++++++++++---
>>  1 file changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
>> index cdc88cde1e9a..417e5a3ccfae 100644
>> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
>> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
>> @@ -399,13 +399,31 @@ static void aspeed_kcs_check_obe(struct timer_list *timer)
>>  static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 state)
>>  {
>>         struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
>> +       int rc;
>> +       u8 str;
>
> str is status, it would be good to spell that out in full.

I guess if it trips enough people up we can rename it later.

>
>>
>>         /* We don't have an OBE IRQ, emulate it */
>>         if (mask & KCS_BMC_EVENT_TYPE_OBE) {
>> -               if (KCS_BMC_EVENT_TYPE_OBE & state)
>> -                       mod_timer(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
>> -               else
>> +               if (KCS_BMC_EVENT_TYPE_OBE & state) {
>> +                       /*
>> +                        * Given we don't have an OBE IRQ, delay by polling briefly to see if we can
>> +                        * observe such an event before returning to the caller. This is not
>> +                        * incorrect because OBF may have already become clear before enabling the
>> +                        * IRQ if we had one, under which circumstance no event will be propagated
>> +                        * anyway.
>> +                        *
>> +                        * The onus is on the client to perform a race-free check that it hasn't
>> +                        * missed the event.
>> +                        */
>> +                       rc = read_poll_timeout_atomic(aspeed_kcs_inb, str,
>> +                                                     !(str & KCS_BMC_STR_OBF), 1, 100, false,
>> +                                                     &priv->kcs_bmc, priv->kcs_bmc.ioreg.str);
>> +                       /* Time for the slow path? */
>
> The mod_timer is the slow path? The question mark threw me.

Yeah, mod_timer() is the slow path; read_poll_timeout_atomic() is the 
fast path and we've exhausted the time we're willing to wait there if 
we get -ETIMEDOUT.

The comment was intended as a description for the question posed by the 
condition. It made sense in my head but maybe it's confusing more than 
it is enlightening?

Andrew

>
>> +                       if (rc == -ETIMEDOUT)
>> +                               mod_timer(&priv->obe.timer, jiffies + OBE_POLL_PERIOD);
>> +               } else {
>>                         del_timer(&priv->obe.timer);
>> +               }
>>         }
>>
>>         if (mask & KCS_BMC_EVENT_TYPE_IBF) {
>> --
>> 2.34.1
>>
