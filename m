Return-Path: <openbmc+bounces-209-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE19BAD9919
	for <lists+openbmc@lfdr.de>; Sat, 14 Jun 2025 02:41:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJyB02cgDz30Pg;
	Sat, 14 Jun 2025 10:41:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749827825;
	cv=none; b=Jn3aX5qxBYjUbv2m9WgzhV9NKxYXtI5Z7b19YZkmXJnVOsL703LQ4npp66F2283z+lEqINMbPwZi4kneAWpa916rsCRHGPMdIOT5mGCUeWNL5Er+iZmynT4OH+EQ2xAHfKYH5s9dl7SkgXxkbSOSGZEMRh5rCN/PcXg/i70TzLik0Hymt55VRxL0s/i+zLgWpzrHs/MM7+4Oa4X9JRE71Agtt5LfEnAzPT7U+Ww7bKWYhVweFhl+JhNxIk7HLNqYzbebkgC1H45gCogXnFD835CBOJWn9Z9pn+jXkc2eHoCuNQgttAqmWYyUuOfMdzT89uDpEDDl8GY6Kl9aWHw1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749827825; c=relaxed/relaxed;
	bh=pNAV61iMlyKs/JveZRubjELrF1cemseXztueaL7XAU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSB/VgxJU0rTuqOogvp1L33kiDPuQDu5dxuIf5DDHY/mWFJRpuK90kRtxOBjf6pYwuez8tNqSdDlDgcxNSkZW8/C8dVTHOoVwdJVbrZLIrC8UoDP5/F4IvYzJlf/Z6/8oh+eHIeZ3z+ilpGxEca6m7MoYbQ4wnjYtcWo2SIZFM6CXKeDopgShSwzfHxLPGbsS+njxHneo2eNyM33+AQl7pOxq02Rh78dW21LVVV37G8k6wxTh+lHyZWc1Vb5WYzc22nSsPEh29L0emnefr3EMIviy0ZqCXlZUacvOa4SZcbeyuh0sZcS4hPv2t3ZAUwrboFHBUc+wnGAGDhv/gkBgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fra3Hq/s; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=bsneha309@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fra3Hq/s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=bsneha309@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJjg41pxzz2xKN
	for <openbmc@lists.ozlabs.org>; Sat, 14 Jun 2025 01:17:03 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7486ca9d396so1596197b3a.1
        for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 08:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749827820; x=1750432620; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pNAV61iMlyKs/JveZRubjELrF1cemseXztueaL7XAU8=;
        b=fra3Hq/sxg0uhcwuuueE375V+SvTrbJ4ydARh79n6053D5fk1t9wBjlnkoHNs0Cd5E
         VfatdPGIfuCcINk2IV7iOZP3yVL766OreYxjDDFjBUUgQe6RlVS7z1LBf3WS+t+QMVWU
         lfckdQG+STjThVIaeNC/0GqM2X0PNwjn/4Cf+h81OIRbEUyYTKo2iVi6J6rCbq/g326z
         MWHkoedyeQFEcIsZll70hd0OCpGbcoFDl02/hD1TctE2pBNHHam+0UTQqeZhImVqyAke
         rRbYWG2dU0ZVxF/3f+z3RVfsG/v5I3xoyqyuVrO0soFQCDdUDZjXcOKMYph+i4IAO4Pv
         55/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827820; x=1750432620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNAV61iMlyKs/JveZRubjELrF1cemseXztueaL7XAU8=;
        b=PRc2B090AwNplFTOk+4TiiHKlJwVPivFZD+6aA/cvadStqdFDQ4KDxrRdnlqjAcFs+
         W3almGDgKxa0kJK4K9TQds+wLKa1HtGwsQJCJRh8sqQZ/J48OxAiQOrfdyaovM9pvvTh
         ptM7+pA50FP07gqdAdCCQNm/nk66CcZE1nC6L40D0f14PPINxe9ClzxgBfDiyzadxXd8
         /VnoOpPSljjkM002zIim6E50xzUBWH7Cc3ATd1OT9jB1bBXial7+w37ZtIF31L1/DOqR
         5mOxyvsujlJxhPRFsEqKAbV5sfw7QvDILnvv+2vR1Jq19V9aTqLwwqb6WS/WQOL8Qkt+
         kxEg==
X-Forwarded-Encrypted: i=1; AJvYcCUKSnKjlkOSx9rB3YLEi3X3JHEEozD0SU5f7CLP8+Bwbjc2kPsjguMz0ye+whT6pL3owMeIA2KL@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSR/EXTKZnGHnyEBLf4K10B8G2H7DDfISKX6vlVIfry1MRil0m
	tBQYXA7/zNxraMeS+LnT0ZAQze7hzy9sTm4ZQyOAVWJplZd2XjPkMPWJIyHuRecD5dVT4Q5iViz
	1S6/HNVqz5jSj8JuuBR/3C2dJNJwuTtU=
X-Gm-Gg: ASbGncv6u6ijmsWQWX4+pFi6rxrdxJOVryWGGtW3gwovzbC6AEA1wUuk4sLd/33rybc
	h2dUbFLRTJM3LYsv+Y2YmGRtmoGcCI8S6bWTmigRRRwYfZTYngs4e1uL0r/V3QTaBx/o0zTikAl
	LlwOnKBSE0BunqO5w8yd+ITitrfeT6si4OwpOdhdwPstKK57vbKK3g
X-Google-Smtp-Source: AGHT+IH8w2Z3dDrVyAvhG4hzWPjQLp/Lpvj+gLmqk0zXwngOqcEbmt1r6hO4felOjUwMFE2lt2ewJsl4290YwUH0Rdo=
X-Received: by 2002:a05:6a00:21d1:b0:746:2c7f:b271 with SMTP id
 d2e1a72fcca58-7488f641129mr4052895b3a.9.1749827819851; Fri, 13 Jun 2025
 08:16:59 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <CAN+wxKK1vwqhCRQ56km1UH6Oi79DAcVeA7t45MWH=7P8nGbOBA@mail.gmail.com>
 <CALGRKGNKBxvdTwjz3X+EPNND2Swm-xjNOMe3B0G5eAT_kwQCKw@mail.gmail.com>
In-Reply-To: <CALGRKGNKBxvdTwjz3X+EPNND2Swm-xjNOMe3B0G5eAT_kwQCKw@mail.gmail.com>
From: Sneha Bansal <bsneha309@gmail.com>
Date: Fri, 13 Jun 2025 20:46:47 +0530
X-Gm-Features: AX0GCFuHqaROvJ-HqYVLYZshur1PLWdceor2SY0vcNeNSv2vYvtcVghi0d1-b2k
Message-ID: <CAN+wxKLWTV4=rWBjssq7okuSZ=-2Ln=p6j8YRXE33_iSj2UTZw@mail.gmail.com>
Subject: Re: Query regarding libbej library
To: Brandon Kim <brandonkim@google.com>
Cc: Kasun Athukorala <kasunath@google.com>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000009ee15d063775892d"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000009ee15d063775892d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks.

On Mon, 9 Jun 2025, 22:32 Brandon Kim, <brandonkim@google.com> wrote:

> @Kasun Athukorala <kasunath@google.com> worked on libbej - perhaps he'll
> be able to help out.
>
> On Fri, Jun 6, 2025 at 7:02=E2=80=AFPM Sneha Bansal <bsneha309@gmail.com>=
 wrote:
>
>> Hi this is sneha here, I was  integrating libbej library in my codebase
>> but was facing some issues. I have few queries regarding the library. Ca=
n
>> you please help me out regarding this? So that i can clear my doubt and
>> perform the integration successfully.
>>
>> Thanks and Regards
>> Sneha Bansal
>>
>

--0000000000009ee15d063775892d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Ok, thanks.</p>
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 9 Jun 2025, 22:32 Brandon Kim, &lt;<a href=3D"mailt=
o:brandonkim@google.com">brandonkim@google.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div dir=3D"ltr"><a class=3D"gmail_plusreply" id=
=3D"m_1036915538413113914plusReplyChip-0" href=3D"mailto:kasunath@google.co=
m" target=3D"_blank" rel=3D"noreferrer">@Kasun Athukorala</a>=C2=A0worked o=
n libbej - perhaps he&#39;ll be able to help out.<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 6, 2025 =
at 7:02=E2=80=AFPM Sneha Bansal &lt;<a href=3D"mailto:bsneha309@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">bsneha309@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">H=
i this is sneha here, I was=C2=A0 integrating libbej library in my codebase=
 but was facing some issues. I have few queries regarding the library. Can =
you please help me out regarding=C2=A0this? So that i can clear my doubt an=
d perform the integration successfully.=C2=A0<div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Thanks and Regards</div><div dir=3D"auto">Sneha Bansal=C2=
=A0</div></div>
</blockquote></div>
</blockquote></div>

--0000000000009ee15d063775892d--

