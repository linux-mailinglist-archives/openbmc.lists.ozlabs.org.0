Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DABBC52B0A4
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 05:12:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2yj85xsgz3bwH
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 13:12:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iboxFKfC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iboxFKfC; dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2yhc1vPYz3c8B
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 13:12:16 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id i23so984644ljb.4
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 20:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=02vSp6NL2SEFHRlZSj840ZFcHVEZ1KrRcvY0n91ShFQ=;
 b=iboxFKfCF5Ftyceu2NQ66HFTJR5fg3z6/0iPDLQkcD+9uO/JQ0Ggqbd6AOnqK45bvQ
 UQuLwZgUBuo28+8Upp/4mq9iSZgGmh9aQRHt28VfuDVXoDoBUeA0G790Q5/nWgefBRa2
 Q1gESIDcXUEn6wdx39uqJok/F4M/SB/7+c5gHf+iV1HWiINAXyPQBDHDAigps9PTMjFK
 yiQNE5m+hGCd2uHEXqJNKwL4nyEvY0EMVKgziP55kA/B9OdFWaCn41aJgli8E24So0Rv
 HZDPQkmZqhZ6eNfv1OHly+KvrO0stTGmQC8rq/V4HNkTHYSygEDXnZJrhkPUBH0cbeWl
 n9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=02vSp6NL2SEFHRlZSj840ZFcHVEZ1KrRcvY0n91ShFQ=;
 b=GUeJD2IROJDeE4KUADBR36bhchm10lLRg0GGfDOy6XYxlsWO0kDoXWI4hpk2Qq+Fiv
 vzDOvAR4ktw0gvT/N9UUE6TkGsknSV+Julp1bERWWVBwPJqGQABXWVnbV2KzA2EEFyrw
 xWom2ZGddiG5McTgxxuSH7/4hxKMT/IKPYlVXQc+qXnD81X/8oDhOgz3OBoj1VT8kqr7
 tQlmEcU9dhMpcieY125F4aduCe7zjDZ9Gqd3yhKksvhySJcBcX2x+bpJlYK5uSu4x57s
 ndAB5PCMU7MZ3ME2MFWokKgRtqYqCvQY3AEf43R56v0rGMJKxwvy4cWqwL+U0DbY85NE
 LKew==
X-Gm-Message-State: AOAM533yAmeOltdRMcLKXJiCWlDTh8MGc0ncAqPSbsSEzHFqP/VkcaDo
 hUdn8eywBBLjUJy5em10hTF5jeIdpQF4sAn0DkI=
X-Google-Smtp-Source: ABdhPJz+aavAXT6ew/Ozo72g2q2TnKFEa4u17xHcKM1USiFhdTE0QY0ypxx1CpJ0wW8tzftLSr1fRdI9BGzrqyaVDxI=
X-Received: by 2002:a2e:a801:0:b0:24a:ff0b:ae7a with SMTP id
 l1-20020a2ea801000000b0024aff0bae7amr15302657ljq.287.1652843531581; Tue, 17
 May 2022 20:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220517092927.19537-1-ctcchien@nuvoton.com>
 <20220517092927.19537-3-ctcchien@nuvoton.com>
 <20220518011937.GA2012974-robh@kernel.org>
In-Reply-To: <20220518011937.GA2012974-robh@kernel.org>
From: Medad Young <medadyoung@gmail.com>
Date: Wed, 18 May 2022 11:12:01 +0800
Message-ID: <CAHpyw9f-hinoQFxvEO6WaRnuWFsbfa97JWi0BY4joEZXLwQf_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: rtc: nuvoton: add NCT3018Y Real Time
 Clock
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, YSCHU@nuvoton.com,
 Benjamin Fair <benjaminfair@google.com>,
 devicetree <devicetree@vger.kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, KFTING <KFTING@nuvoton.com>,
 JJLIU0@nuvoton.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 ctcchien@nuvoton.com, KWLIU@nuvoton.com, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Rob,

thanks a lot.

Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8818=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:19=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, 17 May 2022 17:29:25 +0800, Medad CChien wrote:
> > Document devicetree bindings for the Nuvoton NCT3018Y Real Time Clock.
> >
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> > ---
> >  .../bindings/rtc/nuvoton,nct3018y.yaml        | 44 +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,nct30=
18y.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>
B.R.
Medad
