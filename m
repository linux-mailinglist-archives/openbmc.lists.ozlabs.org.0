Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFF13D06C4
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 04:38:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GV0B04mpbz30CK
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 12:38:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SgIYVi+J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=SgIYVi+J; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GV09j48Ymz2yNK;
 Wed, 21 Jul 2021 12:37:43 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id q190so839171qkd.2;
 Tue, 20 Jul 2021 19:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aN+hI/hvLP5nbqQDgGUl5r57KPkS+zV77YzWwgrtMGA=;
 b=SgIYVi+JsAqUv7JTRn1AA6w9zwtlDsIuFHsCFdjICju832y91ruaa9KPgcb20/XLyK
 Dj8y+e9UNSSCVhl6dm5BaZvPzuL8lpebR/ohiLC64ctrt18pUkldDHdo3bAAiIrlvdtG
 7hijleTo+fyBhyHNa9R23dcHKaP3xJjFIh5Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aN+hI/hvLP5nbqQDgGUl5r57KPkS+zV77YzWwgrtMGA=;
 b=AsORva9BEgHmyyRkHseOcREvjDXKNmKV9nal+u1HDP5qnvcJgG4b6AzBcBT2EtKn7t
 jb8v8GL/L9zy8spfCrKQMKLGZa6BLMoRwe8aH8O7szTTXqXkxuHovIUm9NVB2YfZzQyu
 lp/LT9UqQWnMts2Q2bqxf8Qttn6IHMorMhGF1n4WfF4pCWz+KpWGoPVGNzs0vPfvegRk
 y99bWwTfST12w/R88pqNE0bWHrxY1RyBRvDIlWG71UFBVlJKszZYAfVTloi2AF+TNUDm
 l8DKRPmzgp6dPO4qFYTvs9KRzCT22S4WQoS6t8juiqozt52DuPSagavLqukTZv3xn8qS
 oA5g==
X-Gm-Message-State: AOAM530MMDZWGcPV2B2cMQC/DVwEBE65lZTSNIEbjmmM+jyuEyOPeY8I
 DvZsSDny3Bk6y/qsWfJpbCVDDsR6ilHfD3Qm70M=
X-Google-Smtp-Source: ABdhPJymZQk1TW40WE4GyQwwOME1VOFW1Mi6pvXnbAQmyjoLmM/INX1gpTHax9I8mFo9Yn1FcM/nitv5Wjd+J07Z+7M=
X-Received: by 2002:a37:5c84:: with SMTP id
 q126mr21243926qkb.465.1626835059980; 
 Tue, 20 Jul 2021 19:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210716151850.28973-1-eajames@linux.ibm.com>
 <20210716151850.28973-2-eajames@linux.ibm.com>
In-Reply-To: <20210716151850.28973-2-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Jul 2021 02:37:28 +0000
Message-ID: <CACPK8XcBHGsFu0VoNPutC8HYbLcf0WV-KWNixCdGXxWsf1PDVg@mail.gmail.com>
Subject: Re: [PATCH 1/3] fsi: occ: Force sequence numbering per OCC
To: Eddie James <eajames@linux.ibm.com>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-fsi@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 16 Jul 2021 at 15:19, Eddie James <eajames@linux.ibm.com> wrote:
>
> Set and increment the sequence number during the submit operation.
> This prevents sequence number conflicts between different users of
> the interface. A sequence number conflict may result in a user
> getting an OCC response meant for a different command. Since the
> sequence number is now modified, the checksum must be calculated and
> set before submitting the command.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> @@ -479,11 +483,26 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
>                 return -EINVAL;
>         }
>
> +       /* Checksum the request, ignoring first byte (sequence number). */
> +       for (i = 1; i < req_len - 2; ++i)
> +               checksum += byte_request[i];
> +

This could go below, after you've got the sequence number, so the
checksumming all happens in the same spot?

The driver has become a bit of a maze, I can't tell how you're
deciding what goes in fsi_occ_submit vs occ_write vs occ_putsram. If
oyu have some ideas on how to simplify it then I would welcome those
changes.



>         mutex_lock(&occ->occ_lock);
>
> -       /* Extract the seq_no from the command (first byte) */
> -       seq_no = *(const u8 *)request;
> -       rc = occ_putsram(occ, request, req_len);
> +       /*
> +        * Get a sequence number and update the counter. Avoid a sequence
> +        * number of 0 which would pass the response check below even if the
> +        * OCC response is uninitialized. Any sequence number the user is
> +        * trying to send is overwritten since this function is the only common
> +        * interface to the OCC and therefore the only place we can guarantee
> +        * unique sequence numbers.
> +        */
> +       seq_no = occ->sequence_number++;
> +       if (!occ->sequence_number)
> +               occ->sequence_number = 1;
> +       checksum += seq_no;
> +
> +       rc = occ_putsram(occ, request, req_len, seq_no, checksum);
>         if (rc)
>                 goto done;
