Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3098A414F
	for <lists+openbmc@lfdr.de>; Sun, 14 Apr 2024 10:38:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=TIReNNVB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHNx558Xdz3d4H
	for <lists+openbmc@lfdr.de>; Sun, 14 Apr 2024 18:38:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=TIReNNVB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.25; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 2002 seconds by postgrey-1.37 at boromir; Sun, 14 Apr 2024 18:37:46 AEST
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHNwV6qQcz3bv3
	for <openbmc@lists.ozlabs.org>; Sun, 14 Apr 2024 18:37:46 +1000 (AEST)
Received: from [192.168.1.18] ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id vupUrbnUxReGpvupUrYOs3; Sun, 14 Apr 2024 10:03:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1713081794;
	bh=/EkCWI000WjErTLksVvS3KM3IgVVa6QzMO2SEgMZi3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=TIReNNVBjOjOl2krc105GJvTnNDykkW8fVUJ7UZhaNqn9h9VtBtKHn+bw6l1hbIXI
	 9kH+odrq6fV0aC8H03Yra4RlTUPpeJ1sqwWXj3TpaJZdRMQicnSu3vibO1YJoKhCl8
	 xg6GJApFPfpIpUf+vbg4f2pnhSW8B/x9u8GDuHxqVOMDrQFhR5MG83/FM0/L86HXYV
	 QQ4g5iQ5oxRfTWl2Jocg8sU85D5742BvpAs1NtSafy7QYAvpa/yICs9klSnoI8mc3R
	 OtAgXGsIeYqBMCy/4f12ZhOPDDddLpfXMljgbxOFHGrH0JrxYEU/xyTmVdYjbXKqDv
	 y8Le9PMhci2Zw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Apr 2024 10:03:14 +0200
X-ME-IP: 86.243.17.157
Message-ID: <79bef664-b191-4905-896c-afab341b982b@wanadoo.fr>
Date: Sun, 14 Apr 2024 10:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hwmon: (max31790): Support config PWM output
 becomes TACH
To: Chanh Nguyen <chanh@os.amperecomputing.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Justin Ledford
 <justinledford@google.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20240414042246.8681-1-chanh@os.amperecomputing.com>
 <20240414042246.8681-3-chanh@os.amperecomputing.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240414042246.8681-3-chanh@os.amperecomputing.com>
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Le 14/04/2024 à 06:22, Chanh Nguyen a écrit :
> PWMOUT pins on MAX31790 can be configured as a tachometer input pin by
> setting bit[0] in the Configuration Register. When the bit[0] of a channel
> is set, the PWMOUT pin becomes the tach input pin for the channel plus six.
> 
> This commit allows the kernel to set those pins when necessary if the
> maxim,pwmout-pin-as-tach-input DT property exists.
> 
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
> Changes in v2:
>   - Update the vendor property name to "maxim,pwmout-pin-as-tach-input"   [Rob]

...

> @@ -528,6 +532,33 @@ static int max31790_probe(struct i2c_client *client)
>   	if (err)
>   		return err;
>   
> +	if (device_property_present(dev, "maxim,pwmout-pin-as-tach-input")) {
> +		err = device_property_read_u8_array(dev, "maxim,pwmout-pin-as-tach-input",
> +						    pwmout_to_tach, NR_CHANNEL);
> +		if (err) {
> +			/* The maxim,pwmout-pin-as-tach-input is an array of six values */
> +			dev_warn(dev, "The maxim,pwmout-pin-as-tach-input property exist but malform");

Nit: exists
Nit: malformed or "is malformed"

CJ
