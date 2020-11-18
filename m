Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E102B795A
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 09:49:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cbc2C3zsHzDqfX
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 19:49:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233;
 helo=mail-lj1-x233.google.com; envelope-from=vijaykhemkalinux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bC9V4b3o; dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cbc0g4MtpzDqdk
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 19:48:30 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id r17so1460077ljg.5
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 00:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xiukDSLwwH2TDG6p/ZA4F24hzVU/qXhWZk7p/CFuwFA=;
 b=bC9V4b3otsVoLolSYk1Wauuy7R8p5L9rI3KmAjbcTvyG+IvokRR5tcBLwEZg8lABc8
 +rrYOogNoP+41Lt+/h4Yu5Q4keAykSZH6kh+mQibWlog18w3sI87N+X+lCS4Iqc0/Qyh
 UU/zhCL/OHFeiBE658HCdP12tVjCl3y6pBjTwi9Jo0BizCRkQMrPGrt7v6qye9hzpMM1
 8h6iWFTpdtgyi8g+wiqsyrV+2Yq0Wsg04NC2cL1QV8hLYAQ2Lt7UjQg8VW/dnjXwLN3F
 o/yNJ1dDzhO+93sjM+lHOD9tCVXU30s/TfKlHpwItG4G7/jbi2Y4LEvlwAG4lMjP4Zeg
 jWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xiukDSLwwH2TDG6p/ZA4F24hzVU/qXhWZk7p/CFuwFA=;
 b=RcvORwZZ0TAfZUC07tveXr/BrpkIzO1MfxsstDTHzV0r31Dg1AkwUutwWy0A/GiZIN
 xRZGj9uoy/5uwFwUCSbvxMkLXvOeW4W443ywYq8TdyNHXeiLbOAvcuwtMGx5uDO34yb6
 zmaSd1N5Sje3gy5LV8ZjMvr0GYGvYoZhZ6MUeezT5fvxY6mXHZV4vBeYt8SPRDdCueBD
 URDnX6Sc0Jfqz7MSxrqhOXRqrFo6GejzEwYJSLseIRKmdu9nSrEpLvx/k2DEDr9jRVTH
 J473r4130JdMyfz2yLpkTYRA2++y5YnKqJ9rdDWbe9wjgifx+aY2q0GpAejVpCCxNGSs
 /OOg==
X-Gm-Message-State: AOAM5315h8Z/99fG1a0d29FkC/Lwx9sdvHrj8wo9blqLLTPtyK/8+Y+Y
 rKZjD2vxmBwGqAF3oV2cyxFyiMGHhCK9Wz3C4xE=
X-Google-Smtp-Source: ABdhPJz/8UMWYYgpfScL+0o+XfLuEeVVotMUQuBwDBeUFJKZnKnTxnUMcGZR3pWv1tnBjM9bEJZsXV1OX3qDX2Y0MwM=
X-Received: by 2002:a2e:300a:: with SMTP id w10mr3863670ljw.62.1605689305553; 
 Wed, 18 Nov 2020 00:48:25 -0800 (PST)
MIME-Version: 1.0
References: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
 <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
 <CAJOps0uX9K25NgXpi3M45F=pvvW5Am+9R=wYTLN0SZ2vPUcX-A@mail.gmail.com>
 <EF663847-4E98-4AC2-8A8C-E37B853C131F@fb.com>
 <CAJOps0tR5t4sJQX0-fhBJuKJSnQZJm12gWV9S0OYv4xWU7uzKQ@mail.gmail.com>
 <20201007014324.GG6152@heinlein>
 <CAJOps0tKN4ACB46hoNu1EeX4uaSZ_UeArzcZ=ehGA2sz0oT+aQ@mail.gmail.com>
 <BC4115A9-0587-4135-981E-38C086DDD3F9@fb.com>
 <CAPnigKn5cRVz3RuK-czkHVo2od1ZLpHCVgRu9q4OET-_nPwrWw@mail.gmail.com>
 <20201111121431.GI3614@heinlein>
 <CAJOps0vS6+eiZSdL=w6Trb2K_rTj3Rb2TTyp5_n2=_YrjUgH_w@mail.gmail.com>
In-Reply-To: <CAJOps0vS6+eiZSdL=w6Trb2K_rTj3Rb2TTyp5_n2=_YrjUgH_w@mail.gmail.com>
From: Vijay Khemka <vijaykhemkalinux@gmail.com>
Date: Wed, 18 Nov 2020 00:48:14 -0800
Message-ID: <CAJTGxZGOXb4bK9bvVcuKkv8ZBsaQaJor_gLTrrOW1WnQcPe0fw@mail.gmail.com>
Subject: Re: Request to create repository google-ipmi-bmc-health
To: Sui Chen <suichen@google.com>
Content-Type: multipart/alternative; boundary="000000000000ad5f3605b45dace7"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ad5f3605b45dace7
Content-Type: text/plain; charset="UTF-8"

>
> Hello Patrick,
>
> Thanks for your understanding for our request to create a new repository.
>
> Our team had also met last Friday for a discussion on where the
> implementation of the blob handler should go, and we also agreed it is
> preferable to create a new repository compared to putting its
> implementation in phosphor-health-monitor or phosphor-ipmi-blobs.
>
> Now that the IPMI blob handler lives in its own separate repo, it
> seems to me that the design does not have to be separated right now;
> the new repo could, for now, hold the monolithic IPMI blob handler
> where the metric implementation is entirely in the handler.
>

I completely disagree with this approach of having a platform specific
implementation, I will still prefer to have a generic design in health
monitor
for metrics collection and blob handler can be in a separate repo.


> In the meantime, we will continue to work on the separated design
> where the blob handler does light-weight dbus operations against the
> daemon, starting from addressing the comments. This might take some
> time but we are invested in its design proposal and we are determined
> to finish implementing it.
>
> If this plan sounds reasonable, can we request to create the
> repository now? If the word "health" in the name is a concern, how
> about "google-ipmi-bmc-metrics"?
>
> Thanks!
> Sui
>

--000000000000ad5f3605b45dace7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><br><br>
Hello Patrick,<br>
<br>
Thanks for your understanding for our request to create a new repository.<b=
r>
<br>
Our team had also met last Friday for a discussion on where the<br>
implementation of the blob handler should go, and we also agreed it is<br>
preferable to create a new repository compared to putting its<br>
implementation in phosphor-health-monitor or phosphor-ipmi-blobs.<br>
<br>
Now that the IPMI blob handler lives in its own separate repo, it<br>
seems to me that the design does not have to be separated right now;<br>
the new repo could, for now, hold the monolithic IPMI blob handler<br>
where the metric implementation is entirely in the handler.<br></blockquote=
><div><br></div><div>I completely disagree with this approach of having a p=
latform specific=C2=A0</div><div>implementation, I will still prefer to hav=
e a generic design in health monitor</div><div>for metrics collection and b=
lob handler can be in a separate=C2=A0repo.</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
In the meantime, we will continue to work on the separated design<br>
where the blob handler does light-weight dbus operations against the<br>
daemon, starting from addressing the comments. This might take some<br>
time but we are invested in its design proposal and we are determined<br>
to finish implementing it.<br>
<br>
If this plan sounds reasonable, can we request to create the<br>
repository now? If the word &quot;health&quot; in the name is a concern, ho=
w<br>
about &quot;google-ipmi-bmc-metrics&quot;?<br>
<br>
Thanks!<br>
Sui<br>
</blockquote></div></div>

--000000000000ad5f3605b45dace7--
