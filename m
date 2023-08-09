Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F87768F3
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 21:39:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=DoqQ00h4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLgPS3rHnz3bst
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 05:39:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=DoqQ00h4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 145 seconds by postgrey-1.37 at boromir; Thu, 10 Aug 2023 05:39:24 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLgNr2Hdcz2ysB
	for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2023 05:39:24 +1000 (AEST)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 654F4D461A
	for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2023 19:37:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0116E0002;
	Wed,  9 Aug 2023 19:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691609813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kPW09UgKy6OANt/oXizeTaW2z/JDlSP2rAujG/yz74A=;
	b=DoqQ00h4N3l8g82I0ZotMLLrmV7473F2CyG7q/pznoEogewJrHwAkvN1zwBTHDr2r2X3pY
	z56QJ9ivJ/1lakTN8M+qJDTvNIYTtgroEgjI7nO/4NULO4bInyb8umVaWQi5K+9I+I/sRA
	U4j0JGmVFKcOaEvdJQzvqo8QXzvhk+9ubmU7BPDe1b5HfUgj2di7T8SQ2my0//xOnxVCE2
	7DvgyRj/UEerXl44O9lmj/PVzlrx7Xz4sZOKFXD5SVudeu7UXzAYIDP16+3/4llE1EH9If
	wSXKimT3fE4W06XQeoXRb/EtbNYTy9ubL3zZG9NCjfkMrsWcRLCV5WxHPvm/MQ==
Date: Wed, 9 Aug 2023 21:36:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/2] rtc: nuvoton: Compatible with NCT3015Y-R and
 NCT3018Y-R
Message-ID: <202308091936514bb18c4e@mail.local>
References: <20230809095112.2836-1-mimi05633@gmail.com>
 <20230809095112.2836-3-mimi05633@gmail.com>
 <50bedd75-bcd6-d7bc-26c0-b8c00f99779a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50bedd75-bcd6-d7bc-26c0-b8c00f99779a@linaro.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, conor+dt@kernel.org, tmaimon77@gmail.com, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, Mia Lin <mimi05633@gmail.com>, JJLIU0@nuvoton.com, mylin1@nuvoton.com, tali.perry1@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, KFLIN@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 09/08/2023 16:29:33+0200, Krzysztof Kozlowski wrote:
> On 09/08/2023 11:51, Mia Lin wrote:
> > -	flags = NCT3018Y_BIT_TWO;
> > -	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
> > -	if (err < 0) {
> > -		dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
> > -		return err;
> > +	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
> > +	if (flags < 0) {
> > +		dev_dbg(&client->dev, "%s: read error\n", __func__);
> > +		return flags;
> > +	} else if (flags & NCT3018Y_REG_PART_NCT3018Y) {
> > +		if (!(flags & data->part_number))
> > +			dev_warn(&client->dev, "%s: part_num=0x%x but NCT3018Y_REG_PART=0x%x\n",
> > +				 __func__, data->part_number, flags);
> > +		flags = NCT3018Y_BIT_HF;
> > +		err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
> > +		if (err < 0) {
> > +			dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
> > +			return err;
> > +		}
> > +	} else if (flags & NCT3018Y_REG_PART_NCT3015Y) {
> > +		if (!(flags & data->part_number))
> > +			dev_warn(&client->dev, "%s: part_num=0x%x but NCT3018Y_REG_PART=0x%x\n",
> > +				 __func__, data->part_number, flags);
> 
> I don't think this is correct. Kernel's job is not to verify the DT...
> and why would it verify the device based on DT? You have here device
> detection so use it directly without this dance of comparing with
> compatible/match data.
> 

I fully agree here, either you trust your DT or the device ID but do not
use both.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
