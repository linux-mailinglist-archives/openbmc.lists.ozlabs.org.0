Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 275A197C811
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 12:39:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8X7q0pNJz30gG
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 20:39:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726742356;
	cv=none; b=dg9QrJkAEc2us3IAw1JIta5k0SQ1jJdgMASUgo3rllwe9XWLIHighAPBsmTgUc+UkeRalc9FXLqFTGqqL9Ol/wSIFFVzTTTXY4NbZ7gA9h19lstDu7pMRfkC4MRoRCOBSnpap/+ZC6jQKa/tPPoDidTmJhftDwPGfWRyk/nUD4LmxPKNmr60apdYMTbcV9jJcF4KS7dCj7H8dnu5QQc4UqNxhSk6TOJkw1REfSgqONE7SqbXXoIHhicVZkG4DwzVX5ZH14z2dj6BCWbJNWRevD0BvqydS+gl9JNPQnkymR+kXGB4/ENoY1FU4GD6UPK4BnQyKphit3ZRsiEAjdW4Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726742356; c=relaxed/relaxed;
	bh=5DXo9h2oVRbHD7JVDZJW2T/1RLckUiZiI5QzIdkOC2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1DV5W74lmxbo87Q6vtxsffDEC95nGwyqd7X88D+j4PSSoExQNFq331VSGnTW0h3PDQYB0nfabopKHHF4YYNrSmCjq+Wy0EzTwmlEuWJEBo5G+KGclBOzeBtFx0ipQrWqcx0oyS8B9LuVYNqPCIJuRitoHveTP9At0tPamVygY/DrRkupfwBd3c8tgoLJD/CbXCB/lNNBL2vymlxZwK9SfaTlL4WUkjy6UJu0YAMPWFU29VJzVVeQtucB1hL5AwrTTfExyZnN+sMZLDJR0TuyGHels8cOeq9zBEuqDSB81F56mNzESTyETOHs8QGab62cb5Qu0n84JkylG6F/MRgSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vNEVWHlK; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vNEVWHlK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8X7l5XkHz2yF1
	for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2024 20:39:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D26BEA43BE1;
	Thu, 19 Sep 2024 10:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA452C4CEC4;
	Thu, 19 Sep 2024 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726742352;
	bh=InLdzXxiqcdiaSOfy+6xEmWcnOnKYBZZixeTK3dsjNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vNEVWHlKRx739nBoyNcg8IBVt3muv42eketL9Iz526J4kIokN7x+Mi5BeGuWCdqlA
	 8LpebvZlOfL1m7zGGAMt2YOOpUoBY6POw4jkbBP2WSqszAnpNmf+OQLzL44pJAf31j
	 /EXFnQ0mJ5uOcImQfCLDARlBaCT4rG9O4o8wSeMIG5f6b7mYtZFb+8OPMMaM7Zry/G
	 wE6xsNcHHMp3FZi8WHmiVA0FKSGz+KmTcLbxEN581aLpa48MuEns++tfe5xsLEsc7n
	 Nx+C0cX06CqnL0FByeNThlahYrEu7L2IBztyKqN6QZZChzH4Qgu8zuYIB4Z0OkR8Q1
	 vhzFHlUgNarIw==
Message-ID: <2229b659-c753-4f56-a1ab-7e8984f9147f@kernel.org>
Date: Thu, 19 Sep 2024 12:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: hwmon: Add adt7462
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>,
 Rob Herring <robh@kernel.org>, Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20240918103212.591204-1-chanh@os.amperecomputing.com>
 <20240918220553.GA2216504-robh@kernel.org>
 <d825a93f-be5c-45b9-a8d4-5c412ddec232@amperemail.onmicrosoft.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <d825a93f-be5c-45b9-a8d4-5c412ddec232@amperemail.onmicrosoft.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 19/09/2024 11:43, Chanh Nguyen wrote:
>>> +properties:
>>> +  compatible:
>>> +    const: onnn,adt7462
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  resets:
>>> +    maxItems: 1
>>
>> How would this work? 'resets' generally is used for on-chip devices and
>> a reset controller. That doesn't exist at the board level. A standalone
>> device typically uses a GPIO lines if there's a s/w controlled reset.
>> That would be the 'reset-gpios' property.
>>
> 
> Thank Rob for your comments! The ADT7462 includes an active low reset 
> pin (Pin #14).
> 
> I'll change 'resets' into the 'reset-gpios' property.
> 
> The example in the binding will be

The question how did it work in the first place is still valid... I
think we might benefit from asking people to post their upstreamed DTS.
Otherwise we will take broken or half-baked bindings, because we never
saw the bigger picture. :(

Best regards,
Krzysztof

