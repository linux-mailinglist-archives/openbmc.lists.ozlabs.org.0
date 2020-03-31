Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B1199F19
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 21:30:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sKDp2L5CzDqQ9
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 06:30:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.195;
 helo=mail-il1-f195.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sKCP3bxFzDqvV
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 06:29:37 +1100 (AEDT)
Received: by mail-il1-f195.google.com with SMTP id f16so20614262ilj.9
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 12:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ObOJq1WzFHtkZgBcoc/TF7vJW09KReKL6cLNV8fdqDM=;
 b=tuGRTb7cLMDX43MvzjVqico303LfCJzNAwJ3RkhJX5QDb2fOwuLGPCBYhfJWISJnSx
 VrLAtHhO5mUGiLKrDvnCMEsNu1bpEfHgNU5/aS3oYzFAReSYTgd18RnjT0pQyrY6Jjxi
 z7Gn3ndjhDMYMex4W+0btwa1R4RwtPLzMJVXYbabpLu4ne5dDIfi4ALQjbW68jf4J2/E
 0mOhNpT4ouFk5YLrI0+CFVbtWOO6eXQ5efyAaSA0l5LwUP/teKwNLK4GSARYxfD6UHNm
 H4JQtWSQHWg5w5Rd3S1qxeCmJwUtEBYWdi2Y5GuHUlUQWzIRu7aPRbdN8xCn5ZkZ2Gsu
 6dyQ==
X-Gm-Message-State: ANhLgQ04TdyG7k/rEd/SnCqx4oLIaLuTxhOaV39+LuW9LUBpNIk1elh7
 pwRVx3qSpq6skfSTe6sZAw==
X-Google-Smtp-Source: ADFU+vveQIAPsuGoqvWA/0abYxzmeN+7ZOGjnLvYH/Pd7ZBX8SjDAS/lpIBwApsgmlv7Har/ZIo7TQ==
X-Received: by 2002:a92:3a0b:: with SMTP id h11mr18574962ila.4.1585682974301; 
 Tue, 31 Mar 2020 12:29:34 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id n6sm5174931iod.9.2020.03.31.12.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 12:29:33 -0700 (PDT)
Received: (nullmailer pid 26832 invoked by uid 1000);
 Tue, 31 Mar 2020 19:29:32 -0000
Date: Tue, 31 Mar 2020 13:29:32 -0600
From: Rob Herring <robh@kernel.org>
To: Kun Yi <kunyi@google.com>
Subject: Re: [PATCH linux hwmon-next v2 3/3] dt-bindings: (hwmon/sbtsi_tmep)
 Add SB-TSI hwmon driver bindings
Message-ID: <20200331192932.GA22905@bogus>
References: <20200323233354.239365-1-kunyi@google.com>
 <20200323233354.239365-4-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323233354.239365-4-kunyi@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 04:33:54PM -0700, Kun Yi wrote:
> Document device tree bindings for AMD SB-TSI emulated temperature
> sensor.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>
> Change-Id: Ife3285afa4cf8d410cb7bee1eb930dc0717084f9
> ---
>  .../devicetree/bindings/hwmon/sbtsi_temp.txt       | 14 ++++++++++++++

Convert to DT schema format and use the compatible string as the 
filename.

>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt b/Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt
> new file mode 100644
> index 000000000000..4020f075699e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt
> @@ -0,0 +1,14 @@
> +*AMD SoC SB-TSI hwmon driver.

Bindings are for hardware, not drivers.

Please give a better explanation of what this h/w.

> +
> +Required properties:
> +- compatible: manufacturer and chip name, should be
> +	"amd,sbtsi",
> +
> +- reg: I2C bus address of the device
> +
> +Example:
> +
> +sbtsi@4c {
> +	compatible = "amd,sbtsi";
> +	reg = <0x4c>;
> +};
> -- 
> 2.25.1.696.g5e7596f4ac-goog
> 
