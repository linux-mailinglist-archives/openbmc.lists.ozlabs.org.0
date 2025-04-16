Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E42A90ABD
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 20:03:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd85b2nxkz3cQ4
	for <lists+openbmc@lfdr.de>; Thu, 17 Apr 2025 04:03:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b31"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744826591;
	cv=none; b=KOOId/Q1mkKpWLCHn/jlK5JXnWB7ltHTbtAddwfRoaF6rT/uOmvZtoRwLzEu9HtfZzdN1GBiDwNziN/vQyjmaHLuZKz8ViSwu0ehI4ua71kF2Lz4Dkbe/HvJe73ZyJ/w/hRe4NmB1MQC2Mi5PJcUUoOnHVfBDxiuB3mtaXTHOQSMif6VfBrCfHT4dMq3w0VoIwgnOTMfcD6tUT84pj/gk7Wo+U1BU3bpYUi8Zz9KT1DY4AAYKPXXxaKEyXP3hnDHfR4Ij2bhMp8hzwtvLQ5xKstLa65D+B+gyD0RllMIrGWkCz/E/hRdFwr0zGwChvFNb3ywH7vAJ51291jenu0vzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744826591; c=relaxed/relaxed;
	bh=OuleikaC8BGcJrE4pFFfmyLpEGdaMyvqvwoOlVQB0yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GR44+fLLIM30hceDvEGinpSoKXMhpJEa+u9hxLBdIP1vXSY9UkCJlBjC1JsZwfMXMr7ht6wxS52KAaCvDp20M7Xe3o7qzBo77m10fb1VXlqX/I+xT2/AWuJBYcmvsKGcul8PF1plMDnz0PVX73udEUbmI6MQ2/NmdZxmJbuhenFc7GESXivebsnXAznnfFcfrSrySAg09bb9XlADB19S0Z4JyRh8UUzBidS222qibQ1slKgIB7MlCsusaXMZiyo3kyB5/HQ5ttrjZJr4dW9mKUA7sWVBkvxvNW0pb712bUuYFCT0DNLmunuEHZRtAPagSp9McN6Zb9FA4+uAvje2zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fUWCJKrd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fUWCJKrd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd85W040vz305n
	for <openbmc@lists.ozlabs.org>; Thu, 17 Apr 2025 04:03:10 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e726895a6cdso1750467276.3
        for <openbmc@lists.ozlabs.org>; Wed, 16 Apr 2025 11:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744826589; x=1745431389; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OuleikaC8BGcJrE4pFFfmyLpEGdaMyvqvwoOlVQB0yo=;
        b=fUWCJKrdpXSAgbfs41bdHhGi3aK6p31At3TM7LNzF67Gyz1vF3SknFMYQTXmnGMP7X
         /ixhbCpC4AVQI/r5a5T2ArYX/FO9koUafMBgj0ez2uyIMItd7QjoJw1UU1EWyBXcNuKK
         +TCQBUGiq9Bdx7w+W40rsSQydnFE3BkQfTaD/N5uobvGXTUpr6hbRIvcPlo1Z3LW6I+T
         NQ6GYhUXqn3ZtW6fkznEjbyQsxJcjOIVcWfpd4AedtvACN+3HrHbIlNR8ziTKao5nFrL
         FbLeZMq+sesaBf6fC27LcoEsN+OQerJg1WRS4paQwriAEDVpUOK/dJiehXrRqLtB4Ves
         x/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826589; x=1745431389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OuleikaC8BGcJrE4pFFfmyLpEGdaMyvqvwoOlVQB0yo=;
        b=UV8jtBJoOZSmwWoJFOr+j75NeusHVUcMJziXmwGbZGXriXq61INEDb46Ls0pG+Zwnx
         BfINEGEoYC/YlXOVMwGpkI1g4QwhvODUXM118ImYWYj7y+tZjopI+Y8sgJ+OmfOcoQlX
         s5ax841b9xbRPp4j1eX6rsU8AvhuaO4WympBYN0yNFsOUMnBj4S3D7h/fdRx9kWGIC5I
         iRIQMDEc6pwwwfG5jBe0sX/QEB1ow9/iYuFy1v3iwS/s/CBo7PQ+zPPfDsFc6w/MBvMH
         g9stMvvhQyiDsZ1R9eNX4/IRfqCE7StvunoUpWx22wGvotAcdSgNH9QFz7txkSP1ql+/
         d7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCX4cpeCgCWsmZv1NERuNzA50SZy4NIiXkko/Ud305TTYG2U1WIQh6CogbDwIuRimjLbs2CqdNzL@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx/n7Gh+Lwx1idVQYO1X8uwPlMsdOSMlaY28l4fgU759TsZFOMc
	o66+6o/zKk+mvUjuZ0mpavmpykchtxF6n4zojVAsUXNyVy1nuDRO4qYEY7pnMTYJ/MKVtt7QI2m
	JI4aVJiV+QTm9kKz8ygKm8PAOin4=
X-Gm-Gg: ASbGncvRwr6A+e9lDrenYTFFuq1FJOTNBpF4mmLh6Pf5Myuri5EH97d7IehkkkYHhV2
	AGMT9y7PZu8pXhbByHl/rpKm+9zgUJYeuTYbbtL+FVw9xERojHv65cKb1aeBHOKfWWXWLz4Kl5i
	r40kczksLxZkr5IXN3GGzsF4U=
X-Google-Smtp-Source: AGHT+IH6d5sLoHITBH6SHxSf1RGZPD/HNoPd8+EbPoaGxQjpd/lJOJNYxTJPUBArOhh+2j6JjAatI/5tcLnsRf6twDA=
X-Received: by 2002:a05:6902:2681:b0:e63:5946:940d with SMTP id
 3f1490d57ef6-e727593ed18mr4101928276.20.1744826588741; Wed, 16 Apr 2025
 11:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250401233409.3215091-1-william@wkennington.com> <174369144385.3206748.4237732855581471096.b4-ty@codeconstruct.com.au>
In-Reply-To: <174369144385.3206748.4237732855581471096.b4-ty@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 16 Apr 2025 21:02:57 +0300
X-Gm-Features: ATxdqUF6Nm_u6VtEIg2hxnlKLINoNWGGUs82xnRZ2T0RroYrEysMTsGQiBKmBXo
Message-ID: <CAP6Zq1htTYeMojSATXEiAuwQgVzD-hyrEFx5ia2iuURZ9ZnZCA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: nuvoton: Add OHCI node
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: openbmc@lists.ozlabs.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <william@wkennington.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

William, thanks for the patch.

Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>

On Thu, 3 Apr 2025 at 17:44, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> On Tue, 01 Apr 2025 16:34:09 -0700, William A. Kennington III wrote:
> > The EHCI peripheral already exists in the devicetree, but the hardware
> > also supports a discrete OHCI unit on the same USB PHY. Generic OHCI
> > works fine for this device already and has been tested on real hardware.
> >
> >
>
> Thanks, I've applied this to be picked up through the BMC tree.
>
> --
> Andrew Jeffery <andrew@codeconstruct.com.au>
>
