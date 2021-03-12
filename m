Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC0C338230
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:21:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxRLf4W5kz3d6l
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:21:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=k7kdH2wo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=k7kdH2wo; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxRLQ6t69z2xyD
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:21:02 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id 30so3477849qva.9
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h76ma2y1JUDcyhjOnyJkosotMbHWK9bGVeJrNdMFp3U=;
 b=k7kdH2woaGjKRetdI1vXCuyu21nmrCxqb+xaT96llEYbG5cOWVJFtFTq0Q7bUmUoMS
 5BfxuwlWTvhImrfaQx4HmY6KxzW8ZGliLCWw/r2mKj/EBhUtqvuESJqwv2Ub+n6GoSc0
 pc7ySGMFTiU6XYxu/zpmg4rkD3IQnTi8ZMzSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h76ma2y1JUDcyhjOnyJkosotMbHWK9bGVeJrNdMFp3U=;
 b=d55cWfg708iOc2GBAnJNEDrWpcNLsNs8Wz2Veesj++jNsSgdt7GJA6RhgR7awhRbhA
 p0bmas6wPGwIVJmX2ArEOMquELV4nfXXOfSoThncwsp8yjTBW9hgEp+wzZ63LD5PZQT1
 0G6bwiU/5KmG4JDrCnmxLZ/wB2iBEft5820TfB+pISCCx2oUCdYdws3bRkrzC7Ps/3qQ
 tO6il2aXEldQtxmMqNuJq4xC4/hkP+De8jTj+Isv3Rn9voY1uQixAUJ4IgHGyeU2hZ+0
 1T+qwDruCbw/s4tHxLRIcfUN8OSo78QKd+ky628cL6/miS6BPIP7f3CzgVJ4nkBxCsar
 Xnyw==
X-Gm-Message-State: AOAM533Rnr9mAgAFwKqMuSekLjrGTj9dy+fxAzAKf+GaoLdHyYzRoGOT
 joRO2Oc10/YqVzgOdkF0CxJXTCRHNd+W6DQ+TdI=
X-Google-Smtp-Source: ABdhPJxOxknI4qA23Cfs3PHx6ziFYeU5bIejllqj8Tlj/yGP+fkAPUUg3RQx0FSp5VMWFS7TSoR3dLfnR5NoSq9R3Zc=
X-Received: by 2002:a0c:b894:: with SMTP id y20mr10106203qvf.43.1615508459342; 
 Thu, 11 Mar 2021 16:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-27-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-27-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:20:47 +0000
Message-ID: <CACPK8Xdaj1cbMFt0M-0hU0j05UtVpDqQpn_+1ZsT5FtLA8O+TQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 26/35] fsi: scom: Handle FSI2PIB timeout
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com> wrote:
>
> From: Joel Stanley <joel@jms.id.au>
>
> When the scom engine indicates a FSI2PIB timeout we can recover by
> writing any value to the the reset register.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

This change is incorrect; the logic to do a recovery is already in the
driver. The code needs reworking to run the recovery when a PIB
timeout occurs.

> ---
>  drivers/fsi/fsi-scom.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
> index b45bfab7b7f5..2356a80f7f04 100644
> --- a/drivers/fsi/fsi-scom.c
> +++ b/drivers/fsi/fsi-scom.c
> @@ -38,6 +38,15 @@
>  #define SCOM_STATUS_PIB_RESP_MASK      0x00007000
>  #define SCOM_STATUS_PIB_RESP_SHIFT     12
>
> +/* Values the SCOM_STATUS_PIB_RESP_MASK can take */
> +#define SCOM_PIB_ERR_XSCOM_BLOCKED     0x00004000
> +#define SCOM_PIB_ERR_CHIPLET_OFFLINE   0x00002000
> +#define SCOM_PIB_ERR_PARTIAL_GOOD      0x00006000
> +#define SCOM_PIB_ERR_INVALID_ADDR      0x00001000
> +#define SCOM_PIB_ERR_CLOCK             0x00005000
> +#define SCOM_PIB_ERR_HANDSHAKE         0x00003000
> +#define SCOM_PIB_ERR_TIMEOUT           0x00007000
> +
>  #define SCOM_STATUS_ANY_ERR            (SCOM_STATUS_PROTECTION | \
>                                          SCOM_STATUS_PARITY |     \
>                                          SCOM_STATUS_PIB_ABORT | \
> @@ -250,6 +259,15 @@ static int handle_fsi2pib_status(struct scom_device *scom, uint32_t status)
>         /* Return -EBUSY on PIB abort to force a retry */
>         if (status & SCOM_STATUS_PIB_ABORT)
>                 return -EBUSY;
> +
> +       if (status & SCOM_PIB_ERR_TIMEOUT) {
> +               dev_dbg(&scom->dev, "PIB timeout, recovering\n");
> +               fsi_device_write(scom->fsi_dev, SCOM_FSI2PIB_RESET_REG,
> +                                &dummy, sizeof(uint32_t));
> +               /* Return -EBUSY to force a retry */
> +               return -EBUSY;
> +       }
> +
>         return 0;
>  }
>
> --
> 2.27.0
>
