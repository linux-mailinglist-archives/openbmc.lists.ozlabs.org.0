Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7971CCC15C
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 19:06:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46lGVV5J30zDqfV
	for <lists+openbmc@lfdr.de>; Sat,  5 Oct 2019 03:06:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SYzH2w/g"; 
 dkim-atps=neutral
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lGTd5TqhzDqdt
 for <openbmc@lists.ozlabs.org>; Sat,  5 Oct 2019 03:05:23 +1000 (AEST)
Received: by mail-ua1-x931.google.com with SMTP id i13so2257444uaq.7
 for <openbmc@lists.ozlabs.org>; Fri, 04 Oct 2019 10:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Bxspf8HLJH5gdGjWMKHGlSPShyC1dWEH7oY2lmpXU+M=;
 b=SYzH2w/gnOd71Kc/JD0Z8o6A2zLsJ63EsGs4pBztvU5BQP9UCbDDqmeKwUVMPLpgoT
 VN1LNQR7G/HC04AJSm8DsWrb1UQ7019FkVcD/Wghr6XlZ56aawQ0zrG7uws3chT20USI
 wnEsKlkbB75dHQ9qPo6x6Gfta6snjhdsYyS4HUqGNKhTq8UVvACOzLedGqawH329ewpY
 Wke5pk/sHpAE54KUSCBmS4z/rub+M8JcXW+/Iek3oWz4SkceLHULerBOJD3994+wQZfe
 O240s1Jj1ObV6zPe9kVeLiy7MxG1iCl7fDVzkNGrb/sZCW8vvDVb1lCv3QFfclxvm1yh
 CL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Bxspf8HLJH5gdGjWMKHGlSPShyC1dWEH7oY2lmpXU+M=;
 b=YBZ7Y3Be6r8hQ/OhIudvYJvdd6f8f3AdUS5gnXG6yRGq3qg6Sd2GP2bntZa+kpuj/x
 QOLrs0j9m5ko2nvN/gOkfF1L0+PJOY7UYasgXzlSFgtyVJ5qpxE8lxHJR2qUn+C0jEM4
 Ky2ebsOCZEi31p7KJecm1suRzQTVeynlJ5v4kSRAKSobSPH743XkATvJyLQl+sWQc9mZ
 dYfq5nVWvIfGysXw8AtSFHOi42PZzgXxaQ58kJEj95BHFbsrj+PidpkhWxtFapiTsTVi
 HaX2m3+3cFFlyz+z0R8+wyCp9Gz27ccQujNKTzhDfVu/hH2ZtdzQb6IXySsfc/0qwgRY
 jaVQ==
X-Gm-Message-State: APjAAAXeQJ+NTsK9u6qsug6ekhYdAP/rthDFXOlImKGrcGhpYjUFPxpK
 4WmFNspCGMsU9xdblnbJ1imJsBTun/OZ3Lx+iHQ08sVnS+g=
X-Google-Smtp-Source: APXvYqzkMRMMZ0odkeOfFoAz1sC00vBjKZP6hmnQ20qInAgpVYo7EAWRB2NLgP/zKpk6fCT8QNjLO45B2aQ/+JOpV28=
X-Received: by 2002:ab0:5e85:: with SMTP id y5mr236452uag.55.1570208718709;
 Fri, 04 Oct 2019 10:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <CADfYTpG_Sy4_jNGqZTJKx1Tyivsu+SpBpWy=vNSH7L=Z0PXAEQ@mail.gmail.com>
In-Reply-To: <CADfYTpG_Sy4_jNGqZTJKx1Tyivsu+SpBpWy=vNSH7L=Z0PXAEQ@mail.gmail.com>
From: Nancy Yuen <yuenn@google.com>
Date: Fri, 4 Oct 2019 10:04:42 -0700
Message-ID: <CADfYTpEkDnhx5gTFObOPzuKP4w-v2sLJQmr3xNffPuOyoLLwsA@mail.gmail.com>
Subject: Re: Redfish Aggregator
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000e7532d059418b4a6"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e7532d059418b4a6
Content-Type: text/plain; charset="UTF-8"

Ping?  No one is interested in this?
----------
Nancy


On Fri, Sep 27, 2019 at 12:59 PM Nancy Yuen <yuenn@google.com> wrote:

> Has anyone looked at the Redfish Aggregator proposal that was voted on in
> DMTF recently?
> We have a need for this functionality. Would anyone else find it useful?
> Would anyone be interested in collaborating?
>
> ----------
> Nancy
>

--000000000000e7532d059418b4a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping?=C2=A0 No one is interested in this?<br clear=3D"all"=
><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_si=
gnature">----------<br>Nancy</div></div><br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 27, 2019 at 12:59 P=
M Nancy Yuen &lt;<a href=3D"mailto:yuenn@google.com">yuenn@google.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr">Has anyone looked at the Redfish Aggregator proposal that was vo=
ted on in DMTF recently?<div>We have a need for this functionality. Would a=
nyone else find it useful? Would anyone be interested in collaborating? </d=
iv><div><br></div><div><div><div><div dir=3D"ltr">----------<br>Nancy</div>=
</div></div></div></div>
</blockquote></div>

--000000000000e7532d059418b4a6--
