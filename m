Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6140B65C029
	for <lists+openbmc@lfdr.de>; Tue,  3 Jan 2023 13:48:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmXbp2fMhz3bgG
	for <lists+openbmc@lfdr.de>; Tue,  3 Jan 2023 23:48:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmXbP0tL1z2y7W
	for <openbmc@lists.ozlabs.org>; Tue,  3 Jan 2023 23:48:30 +1100 (AEDT)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5030960293A85;
	Tue,  3 Jan 2023 13:48:23 +0100 (CET)
Message-ID: <4d64e3f9-57a3-c6be-2709-36e9a1617bf9@molgen.mpg.de>
Date: Tue, 3 Jan 2023 13:48:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 7/7] media: nuvoton: Add driver for NPCM video capture
 and encode engine
To: Kun-Fa Lin <milkfafa@gmail.com>
References: <20221227095123.2447948-1-milkfafa@gmail.com>
 <20221227095123.2447948-8-milkfafa@gmail.com>
 <b8f173c0-6d40-d6aa-543e-fa8b06557f4f@molgen.mpg.de>
 <CADnNmFr1naRfam=z0p-4hEugSDJy_HCK8XZyQJ0eFirnmwuH4A@mail.gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CADnNmFr1naRfam=z0p-4hEugSDJy_HCK8XZyQJ0eFirnmwuH4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, andrzej.p@collabora.com, robh+dt@kernel.org, linux-media@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, kflin@nuvoton.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Kun-Fa,


Am 29.12.22 um 09:55 schrieb Kun-Fa Lin:

>>> Add driver for Video Capture/Differentiation Engine (VCD) and Encoding
>>> Compression Engine (ECE) present on Nuvoton NPCM SoCs. The VCD can
>>> capture and differentiate video data from digital or analog sources,
>>
>> “differentiate video data” sounds uncommon to me. Am I just ignorant or
>> is there a better term?
> 
> How about "The VCD can capture a frame from digital video input and
> compare two frames in memory, then the ECE will compress the frame
> data into HEXTITLE format", is it better?

Yes, I prefer your suggestion.

>> Wich VNC viewer and version?
> 
> I used RealVNC version 6.21.1109 to test.
> Do I have to add this information in the commit message?

I do not think there are rules, but I prefer to have the test 
environment and procedure information in the commit message in case 
there are problems, and you want to reproduce things.

>> Maybe also paste the new dev_ log messages you get from one boot.
> 
> Do you mean dev_info/dev_debug messages of the driver?
> If yes, I get these messages from one boot (only dev_info will be
> printed in default):
> 
> npcm-video f0810000.video: assigned reserved memory node framebuffer@0x33000000
> npcm-video f0810000.video: NPCM video driver probed

Yes, that is what I meant. Maybe even the debug messages.

>> It’d be great if you noted the datasheet name and revision.
> 
> I can note the datasheet name and revision in the commit message but
> can't provide the file link because it is not public.
> Is it ok with you?

Yes, that would be ok with me.

>>> +static unsigned int npcm_video_ece_get_ed_size(struct npcm_video *video,
>>> +                                            u32 offset, u8 *addr)
>>> +{
>>> +     struct regmap *ece = video->ece.regmap;
>>> +     u32 size, gap, val;
>>
>> Using a fixed size type for variables not needing is, is actually not an
>> optimization [1]. It’d be great, if you went over the whole change-set
>> to use the non-fixed types, where possible. (You can also check the
>> difference with `scripts/bloat-o-meter`.
> 
> So what I have to do is replace "u8/u16/u32" with "unsigned int" for
> generic local variables as much as possible.
> Is my understanding correct?

Yes, I would say so.

>>> +MODULE_AUTHOR("Joseph Liu<kwliu@nuvoton.com>");
>>> +MODULE_AUTHOR("Marvin Lin<kflin@nuvoton.com>");
>>
>> Please add a space before the <.
>>
>>> +MODULE_DESCRIPTION("Driver for Nuvoton NPCM Video Capture/Encode Engine");
>>> +MODULE_LICENSE("GPL");
>>
>> Not GPL v2?
> 
> I'll correct them in the next patch.

Awesome.


Kind regards,

Paul
