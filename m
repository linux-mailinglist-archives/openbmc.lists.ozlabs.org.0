Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDDA723FC5
	for <lists+openbmc@lfdr.de>; Tue,  6 Jun 2023 12:38:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb6Q24WZyz3f1Q
	for <lists+openbmc@lfdr.de>; Tue,  6 Jun 2023 20:38:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=a1ba=b2=xs4all.nl=hverkuil-cisco@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb6Pj3Fx2z2xnK
	for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2023 20:38:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83EE861E13;
	Tue,  6 Jun 2023 10:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D7DC433EF;
	Tue,  6 Jun 2023 10:37:55 +0000 (UTC)
Message-ID: <c4676e35-322c-7091-65d0-4e50ba04ca85@xs4all.nl>
Date: Tue, 6 Jun 2023 12:37:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v11 3/7] dt-bindings: arm: nuvoton: Add NPCM GFXI
Content-Language: en-US
To: Kun-Fa Lin <milkfafa@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230207091902.2512905-1-milkfafa@gmail.com>
 <20230207091902.2512905-4-milkfafa@gmail.com>
 <867ec517-ef29-e8ac-8e0c-6f7ca440cf3d@linaro.org>
 <CADnNmFpf8kMeHYrUcab5Mg3P0zZ=kUi3o8bLCz-EdyAHVKoLNw@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CADnNmFpf8kMeHYrUcab5Mg3P0zZ=kUi3o8bLCz-EdyAHVKoLNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-media@vger.kernel.org, tali.perry1@gmail.com, andrzej.p@collabora.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org, kflin@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 09/02/2023 01:40, Kun-Fa Lin wrote:
> Hi Krzysztof,
> 
> Thank you for the review.
> 
>>>  .../bindings/arm/npcm/nuvoton,gfxi.yaml       | 39 +++++++++++++++++++
>>
>> This is still wrong location. arm is only for top-level pieces. You
>> wanted to put it in soc.
> 
> I'll move it to Documentation/devicetree/bindings/soc/npcm/nuvoton,gfxi.yaml.

v12 still has this in the old location, so it appears you forgot this.

Regards,

	Hans

> 
> Regards,
> Marvin

