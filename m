Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B8E1B6211
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 19:37:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497Pcs03bRzDr1q
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 03:37:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=gB5E/ll8; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497Pbz0N3BzDr1j
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 03:36:12 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id f18so7056704lja.13
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 10:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UOVmXSX74mklbroBvmMIig9CmlSfaqIoZKAVU6BG6uA=;
 b=gB5E/ll8uK9SHjyZ58YBjnOm4EYaU5tiXPPEIWMaaZwXH0FvDl/qSBNiUCRPK6Zj9r
 a6+H9r4+KW9x9EVvfCybcfO9/S72MEOjlNpAxVsqrz9liJkWMeRqMUJeX8S6AgWO5TQ0
 VDMaGs5FAv1pO9ZVyA/ActBjHsAj/pzSjFHq4rFqKsTj8lp6duD5E5yT/4M7nzYaPERa
 QWXKJIyuoOXTM/Z7EE5BMwyT4i7kqigZ7w1ecuL/UHAOJ8bCj7gik0l66RipCLJNVV/X
 qTOGFiZVehwSS0KD0zCkv0HAMykiCgiV3fVaMZmwS0ZVf0b1A543p6DlLNox8jxcvkcI
 lViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UOVmXSX74mklbroBvmMIig9CmlSfaqIoZKAVU6BG6uA=;
 b=X3qJoXeatUVT+vXL0aY7g4U+Xj9cZS4uFg3uK+SuUzwWa40EqSkh9sQRRoZqiPY3ZG
 LOzdt3/Y/V1RVd/XRWrZX4i7epz4T1STiFiUXb5We711b8aOGOSweFta36ZWy99g9kXr
 ku8DYX+W3RKqgHXkZa3m1HMIUySDaFpDGNrmWNdcqeM/E9fjqvNDfh/lB2iiff8En4oL
 CTxLiHypED7OyU8No5zBYJbH2MIzUfhovWpxh/9xXjrTTNvP1kVYFI4hPuc6iIvIbYVP
 y/9EMYX7C89u4DsquWkF2JopZ05e6zc85RImpNFSQTbBYhl/+Y0sA8YvIqactSTtYYvn
 Snlw==
X-Gm-Message-State: AGi0PuaPJ/fRRu2fkInwzqADWjBEr+WcN5g7RwyB4Ev7vBbbRVUtOtt6
 i6DDnMM+j2jaFCh2V8tP7rwejUGb0KkDn9wX+EiMxw==
X-Google-Smtp-Source: APiQypJudhNMGnqPtmqtGym+T4syWhBroIMSaxOc67jzkjdpMykUcXia4XBU5E7InenVRExa0t1bEQEgjlhpkeHFeP0=
X-Received: by 2002:a2e:164b:: with SMTP id 11mr2978642ljw.23.1587663367365;
 Thu, 23 Apr 2020 10:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.1237.1587601186.5884.openbmc@lists.ozlabs.org>
 <1DF7E55B-29E9-43A2-9981-F67521B2B3E2@quantatw.com>
 <c34fc105-657d-1e33-e3fc-90cb5afba75a@linux.ibm.com>
 <CAMXw96NDQ7CrY_pTZH+NugOD_6Z0HiKw1dO4vKkpaiRauFgVyQ@mail.gmail.com>
In-Reply-To: <CAMXw96NDQ7CrY_pTZH+NugOD_6Z0HiKw1dO4vKkpaiRauFgVyQ@mail.gmail.com>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 23 Apr 2020 10:35:55 -0700
Message-ID: <CAH1kD+YFYom+qJLBV4rvX6=j2vZSty0GNYw=MGQNG0P60b8h7Q@mail.gmail.com>
Subject: Re: mTLS on bmcweb
To: Zhenfei Tai <ztai@google.com>
Content-Type: multipart/alternative; boundary="0000000000000959c105a3f8afb3"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000959c105a3f8afb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My guess is that somehow the root cert used to validate clients isn't
installed correctly, and so it's defaulting to basic auth.

At least that's my reading of this review
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27270



On Thu, Apr 23, 2020 at 9:47 AM Zhenfei Tai <ztai@google.com> wrote:

> I guess part of my question is how to configure the mTLS certs to make it
> work properly.
>
> So far only https works (server side TLS).
>
> Thanks,
> Zhenfei
>
> On Thu, Apr 23, 2020 at 8:50 AM Joseph Reynolds <jrey@linux.ibm.com>
> wrote:
>
>> On 4/23/20 5:47 AM, P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) wrote:
>> > Hi,
>> >
>> > I encountered the same issue when using Redfish to replace the
>> certificate.
>> > Regardless of whether the parameters include --cert --key --cacert or
>> only --cacert, the authentication can still succeed.
>> >
>> > Best,
>> > P.K.
>> >
>> >> Date: Wed, 22 Apr 2020 14:58:06 -0700
>> >> From: Zhenfei Tai <ztai@google.com>
>> >> To: openbmc@lists.ozlabs.org
>> >> Subject: mTLS on bmcweb
>> >> Message-ID:
>> >>      <CAMXw96Pp511sUO=3Dq1XLz2uJzh4S6D7tUwmkvpbnq_yU-iJfiKg@mail.g
>> >> mail.com>
>> >> Content-Type: text/plain; charset=3D"utf-8"
>> >>
>> >> Hi,
>> >>
>> >> I'm trying out bmcweb mTLS which should be enabled by default by
>> >> https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L89
>> >>
>> >> In my test, I created a self signed key and certificate pair, stacked
>> them
>> >> up into server.pem in /etc/ssl/certs/https that bmcweb uses.
>> >>
>> >> However when I tried to curl bmcweb service, I was able to get
>> response by
>> >> only supplying the cert.
>> >>
>> >> curl --cacert cert.pem  https://${bmc}/redfish/v1
>> >>
>> >> With the mTLS enabled, I expected it should error out since no client
>> >> certificate is provided.
>> >>
>> >> Could someone with relevant knowledge help with my question?
>>
>> I'm not sure what you are asking.  Are you asking how to install mTLS
>> certs into the BMC and then use them to connect?  I am still waiting for
>> documentation that describes how to configure and use the mTLS feature.
>>
>> I've added an entry to the security working group as a reminder to do
>> this.  (I don't have the skill to document this feature.)
>>
>> - Joseph
>>
>> >>
>> >> Thanks,
>> >> Zhenfei
>>
>>

--0000000000000959c105a3f8afb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My guess is that somehow the root cert used to validate cl=
ients isn&#39;t installed correctly, and so it&#39;s defaulting to basic au=
th.<div><br></div><div>At least that&#39;s my reading of this review=C2=A0<=
a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27270">http=
s://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27270</a><br><br></div><d=
iv><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, Apr 23, 2020 at 9:47 AM Zhenfei Tai &lt;<a href=3D"mai=
lto:ztai@google.com">ztai@google.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I guess part of my que=
stion is how to configure the mTLS certs to make it work properly.<div><br>=
</div><div>So far only https works (server side TLS).</div><div><br></div><=
div>Thanks,</div><div>Zhenfei</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23, 2020 at 8:50 AM Joseph R=
eynolds &lt;<a href=3D"mailto:jrey@linux.ibm.com" target=3D"_blank">jrey@li=
nux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 4/23/20 5:47 AM, P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) wrot=
e:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I encountered the same issue when using Redfish to replace the certifi=
cate.<br>
&gt; Regardless of whether the parameters include --cert --key --cacert or =
only --cacert, the authentication can still succeed.<br>
&gt;<br>
&gt; Best,<br>
&gt; P.K.<br>
&gt;<br>
&gt;&gt; Date: Wed, 22 Apr 2020 14:58:06 -0700<br>
&gt;&gt; From: Zhenfei Tai &lt;<a href=3D"mailto:ztai@google.com" target=3D=
"_blank">ztai@google.com</a>&gt;<br>
&gt;&gt; To: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">=
openbmc@lists.ozlabs.org</a><br>
&gt;&gt; Subject: mTLS on bmcweb<br>
&gt;&gt; Message-ID:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;CAMXw96Pp511sUO=3Dq1XLz2uJzh4S6D7tUwmkvpbn=
q_yU-iJfiKg@mail.g<br>
&gt;&gt; <a href=3D"http://mail.com" rel=3D"noreferrer" target=3D"_blank">m=
ail.com</a>&gt;<br>
&gt;&gt; Content-Type: text/plain; charset=3D&quot;utf-8&quot;<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m trying out bmcweb mTLS which should be enabled by default =
by<br>
&gt;&gt; <a href=3D"https://github.com/openbmc/bmcweb/blob/master/CMakeList=
s.txt#L89" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/=
bmcweb/blob/master/CMakeLists.txt#L89</a><br>
&gt;&gt;<br>
&gt;&gt; In my test, I created a self signed key and certificate pair, stac=
ked them<br>
&gt;&gt; up into server.pem in /etc/ssl/certs/https that bmcweb uses.<br>
&gt;&gt;<br>
&gt;&gt; However when I tried to curl bmcweb service, I was able to get res=
ponse by<br>
&gt;&gt; only supplying the cert.<br>
&gt;&gt;<br>
&gt;&gt; curl --cacert cert.pem=C2=A0 https://${bmc}/redfish/v1<br>
&gt;&gt;<br>
&gt;&gt; With the mTLS enabled, I expected it should error out since no cli=
ent<br>
&gt;&gt; certificate is provided.<br>
&gt;&gt;<br>
&gt;&gt; Could someone with relevant knowledge help with my question?<br>
<br>
I&#39;m not sure what you are asking.=C2=A0 Are you asking how to install m=
TLS <br>
certs into the BMC and then use them to connect?=C2=A0 I am still waiting f=
or <br>
documentation that describes how to configure and use the mTLS feature.<br>
<br>
I&#39;ve added an entry to the security working group as a reminder to do <=
br>
this.=C2=A0 (I don&#39;t have the skill to document this feature.)<br>
<br>
- Joseph<br>
<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; Zhenfei<br>
<br>
</blockquote></div>
</blockquote></div>

--0000000000000959c105a3f8afb3--
