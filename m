Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC80836A7F
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 05:32:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KB6g1StYzDqgV
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 13:32:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::133; helo=mail-it1-x133.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pRQSQyFg"; 
 dkim-atps=neutral
Received: from mail-it1-x133.google.com (mail-it1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KB6F2HkJzDqcY
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 13:31:49 +1000 (AEST)
Received: by mail-it1-x133.google.com with SMTP id r135so942829ith.1
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jun 2019 20:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mhIiovPTm6zymfqjK6wBCsslfqZ7opwJCY3Lo4MKLBE=;
 b=pRQSQyFgui89THOGFyIcjxdH6H9TO7j8ljmVO06sTcBBTt7WKVuRbFsjlUHIdxkp/V
 3jSSRqrNQY+7farSYui0FHhjfPb0AkcSvIm171cHiX1/Vw2JZcIH2zAKxjbfZg9MahN8
 r4pUZvHQPGOmCHtY7GpXVmfz42vzqNtX7GTK5eX2K1kl1zML3Uny5EIoU8lD0ym58kV2
 W4ScD4rXsXwiiYxoo+Nh21L8GlhKzBm4VGJxCvu/vZ9VlD8yA3+ctP9SXH30WwWMhwGD
 4DJ9rxJKTkIAUOPDeC+CCHqI8aUeZtACx0LUMpSwWlUi/ZZv948z7SdaYWjx5HTAVSxe
 VlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mhIiovPTm6zymfqjK6wBCsslfqZ7opwJCY3Lo4MKLBE=;
 b=qzm8n2kXIQppJkddVH3WP5X1L3Nih2T5x6ZIQeTxqa/TjvvTl1OkXBlnJqxgwNS4Bs
 iELdVudMEYJ8NlCUnIrs0DAUAmHOxDogp2xF7/yfwEA5qKvnbvco9tQhW1O2bxOhq40g
 lSOe9TMfLacFffWkM9JY/aeLcYvCT7StgAaStEJo5cxymFtX27MhknS7BsQujrJea3y6
 2CaLhaQ27HEntXDdTtqU2iuQKPRT7ozooMfh6vJLNcm88DN81GrRFnjt6M7ra/4LgvOZ
 ETS3P0ejocZsK29KfxP7AwdaRB1EAqguOFFH7XqdAFM/ajJgZGb9hDH/oxhvCT8XBUn+
 Ynow==
X-Gm-Message-State: APjAAAWp5BsazAg/VbKzNHwhtgkkOR4sEG3xuzNzUd5XNMKanPPZwyhb
 SYaS81uz7kEhTxgDffivwDbEd97ElbOos/OMCNU=
X-Google-Smtp-Source: APXvYqz6xKwezPlAS7mwnwFT4I6QRSbI3ThKZ0nPz6re/nzSgdBu3BsHu4oV1zcYgN+YkjS3t+62lm6PXTjplSgDD+A=
X-Received: by 2002:a02:69d7:: with SMTP id e206mr30270546jac.21.1559791905743; 
 Wed, 05 Jun 2019 20:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <20190604182635.GD46814@mauery.jf.intel.com>
 <CAARXrtnpeP0J3T0y=K=O1QTYjxBXXxQSzUVErygzUo+MR6t=0w@mail.gmail.com>
 <f1d99c51-881e-c1f3-79e6-1d9be951b0c4@linux.ibm.com>
In-Reply-To: <f1d99c51-881e-c1f3-79e6-1d9be951b0c4@linux.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 6 Jun 2019 11:31:33 +0800
Message-ID: <CAARXrt=6DwO7cAxyEJ=FEUPF4+gU9npJtWmd31LuqmTpxHu98w@mail.gmail.com>
Subject: Re: [Design] PSU firmware update
To: Matt Spinler <mspinler@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 5, 2019 at 10:25 PM Matt Spinler <mspinler@linux.ibm.com> wrote:
>
>
> On 6/5/2019 1:18 AM, Lei YU wrote:
> >>> The PSU firmware code update will re-use the current interfaces to upload,
> >>> verify, and activate the image.
> >> We would like the option to be able to ship the PSU firmware as part of
> >> the BMC image (in the root filesystem). This means that it is already
> >> present and authenticated when the BMC boots. In this way, we know that
> >> the current BMC firmware plays well with the PSU firmware and have fewer
> >> variables to test for when making a release.
> > Because the PSU firmware is part of BMC image, this seems a completely
> > different approach, and more like part of BMC image update, is it?
> > I would expect this should not be part of this design, what do you think?
>
> FYI, I am 99% sure this is how IBM needs its systems to work as well.
> That being the case,
>
> will you also be handling this design?

Good to know.

Then a question comes up:
In which cases PSU firmware update shall be done?
1. It is updated together with BMC firmware update as described by Vernon
   Mauery;
2. It is updated independently with APIs, as described in this design doc.

Will 1 and 2 both be valid, or only 1 is the real case and we do not need to
support 2?

The reason I ask is because if we could get clear requirements, it is possible
to simplify the design.
