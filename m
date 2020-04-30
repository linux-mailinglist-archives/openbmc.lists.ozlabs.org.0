Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A51931C0B04
	for <lists+openbmc@lfdr.de>; Fri,  1 May 2020 01:40:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CsLy5pdMzDrJC
	for <lists+openbmc@lfdr.de>; Fri,  1 May 2020 09:40:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::c2e;
 helo=mail-oo1-xc2e.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MWWAkGlP; dkim-atps=neutral
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CsL96TwgzDr0d
 for <openbmc@lists.ozlabs.org>; Fri,  1 May 2020 09:39:45 +1000 (AEST)
Received: by mail-oo1-xc2e.google.com with SMTP id t12so370337oot.2
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 16:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iX8mxavo3gsacrX9Va3SJmUVjOCEtbOUu16JIeCp6UU=;
 b=MWWAkGlP34H11W8HkmAFwog2MJUUCZj5VQu9nWJ4lgHWxVgS+gB+A8l6AJpLdmkq/7
 UucYU6D/6VRxbviN9FducW+UEc5H5AkhE3E1V/yCKBAlWw5CY6IfIl5v2JIZ2fpuMcZS
 vDMGB88Z35A0gc0C8je9P3if/4wOUkWqu0XLrztPbb9y90H7U7V/X/ovXCDpkWSaDMI+
 6BGWTbCveGn9Mpm0f3l6OfPWebvB0/mnhwTf0K2COfrD+uFHNnJ3VBnjsL0qpeieW8w2
 WXc6JNYPqmApoKnjQtZQ/Db6HUJ0R3HDvD6nd1rqZTKzz0iF8+UhaZlvbsUdKpGr1ahc
 KOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iX8mxavo3gsacrX9Va3SJmUVjOCEtbOUu16JIeCp6UU=;
 b=oj6lcUmzwv5ptueCy2fj6c7QwlPRiyn51np4+mnnZFz7b5boNOpFpY9RxRP54ai7pn
 6M1RZZgiB6XCDbHc97sx2zV19x5Es7DiDyCfroWQBwF7JcTUgRlGKua0QI0C+6NF5ezY
 T31Bhrz0q82VNbsDw/DsL0PW7IYmPC0n0GB9BucisEJ8bz27wGLetmyh4hV69q34Gklb
 SMUNENLSizx1EF+arDvOX2ZxF/Fg/IJ+5jVwAwG7pioUVL+kjJ4SSOagqYVJYzHOJdkh
 zbIEnNgfm6aHXQ5YekzC7mqosH0gFSv4qmgJ2ytO3KSR6cNncWeSmPmUcO4/ygcJISB9
 YaQw==
X-Gm-Message-State: AGi0PuZ1sXRwN+gwLTZH7TmvlnqMISgQVhNgeCB4jR115oI9Rzeflz2/
 z7Dk8vgZbg48gJ8BrWd7RQGw9a3T7KITm3OUXUHOtGj5FpU=
X-Google-Smtp-Source: APiQypIUyGg93MgpPyTC1K5lFI/fayIQHy/NffwAgxC+8Q8excW/BtD34L4AlODQ+OopgQ99R8kVS4RgTw0gevWnGXQ=
X-Received: by 2002:a4a:d0d6:: with SMTP id u22mr1469293oor.63.1588289981247; 
 Thu, 30 Apr 2020 16:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.1237.1587601186.5884.openbmc@lists.ozlabs.org>
 <1DF7E55B-29E9-43A2-9981-F67521B2B3E2@quantatw.com>
 <c34fc105-657d-1e33-e3fc-90cb5afba75a@linux.ibm.com>
 <CAMXw96NDQ7CrY_pTZH+NugOD_6Z0HiKw1dO4vKkpaiRauFgVyQ@mail.gmail.com>
 <CAH1kD+YFYom+qJLBV4rvX6=j2vZSty0GNYw=MGQNG0P60b8h7Q@mail.gmail.com>
 <1251a083-2d63-aa7e-32f4-cf876dde8e4e@linux.intel.com>
 <894c0142737c45d891953801468135d1@quantatw.com>
 <CAMXw96MT8Co4dDMnWVJj1pXUksV7Bgn14+nykLA=tvyvXShniw@mail.gmail.com>
 <CAMXw96O3Ve0SNaMFdFU52eZ=oLkpveTzG5wmhg_y3B_uHTHXHA@mail.gmail.com>
In-Reply-To: <CAMXw96O3Ve0SNaMFdFU52eZ=oLkpveTzG5wmhg_y3B_uHTHXHA@mail.gmail.com>
From: Zhenfei Tai <ztai@google.com>
Date: Thu, 30 Apr 2020 16:39:30 -0700
Message-ID: <CAMXw96OYq0EqxigwPtqimPp5nJrJhJ9rVQqqpEv8Dt5tvyNKoQ@mail.gmail.com>
Subject: Re: mTLS on bmcweb
To: =?UTF-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>
Content-Type: multipart/alternative; boundary="00000000000022445105a48a946d"
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
 =?UTF-8?Q?Wiktor_Go=C5=82gowski?= <wiktor.golgowski@linux.intel.com>,
 "jrey@linux.ibm.com" <jrey@linux.ibm.com>, Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000022445105a48a946d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I did more testing and found the reason why it accepts any client
certification.
The error is due to the self signed certificate cannot be found in the list
of trusted certificates.
Without the user defined verify callback function, it works as expected.

#define  X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT
<https://docs.huihoo.com/doxygen/openssl/1.0.1c/crypto_2x509_2x509__vfy_8h.=
html#aa4f5a3309eae833f85dff37c36fa039d>
   18

// Check if certificate is OK
int error =3D X509_STORE_CTX_get_error(cts);
if (error !=3D X509_V_OK)
{
return true;
}

On Thu, Apr 30, 2020 at 12:09 PM Zhenfei Tai <ztai@google.com> wrote:

> Also, with that change in http_connection.h, it still accepts any client
> certificate provided in curl.
>
> Here's what I did:
> 1. Disable BMCWEB_ENABLE_MUTUAL_TLS_AUTHENTICATION
> 2. Uncommented ssl_key_handler.hpp:315 and added the
> boost::asio::ssl::verify_fail_if_no_peer_cert
>
> Behavior after change:
> 1. Rejects curl without client certificate.
> 2. Returns when client certificate matches the one authority directory.
> 3. Rejects when client sends other certificates.
>
> The change is just for testing purposes, I guess the original intention
> was not to mTLS every request.
>
> On Thu, Apr 30, 2020 at 11:34 AM Zhenfei Tai <ztai@google.com> wrote:
>
>> Hi P.K.
>>
>> I tried the same thing.
>>
>> Could you share which url you tested?
>> With that change, if I access the https://${bmc}/redfish/v1 url in
>> chrome, it prompts to choose a client certificate, but will also work if=
 no
>> certificate is chosen.
>>
>> Thanks,
>> Zhenfei
>>
>> On Thu, Apr 30, 2020 at 6:27 AM P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) =
<P.K.Lee@quantatw.com>
>> wrote:
>>
>>> I found a way to fix this issue, but it needs to be modified to the
>>> source code. In two steps:
>>>
>>> Step 1.
>>> The source code
>>> "adaptor.set_verify_mode(boost::asio::ssl::verify_peer);" in
>>> http_connection.h is replaced with
>>> "adaptor.set_verify_mode(boost::asio::ssl::verify_peer |
>>> boost::asio::ssl::verify_fail_if_no_peer_cert);"
>>>
>>> Step 2.
>>> AccountService->Oem->OpenBMC->AuthMethods->TLS is set. (false by defaul=
t)
>>>
>>> It will enable enforce mTLS authentication.
>>>
>>> Best,
>>> P.K.
>>>
>>> > -----Original Message-----
>>> > From: Wiktor Go=C5=82gowski <wiktor.golgowski@linux.intel.com>
>>> > Sent: Saturday, April 25, 2020 1:03 AM
>>> > To: Richard Hanley <rhanley@google.com>; Zhenfei Tai <ztai@google.com=
>
>>> > Cc: openbmc@lists.ozlabs.org; P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC)=
 <P.K.Lee@quantatw.com>;
>>> > jrey@linux.ibm.com; P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) <P.K.Lee@=
quantatw.com>; Joseph
>>> > Reynolds <jrey@linux.ibm.com>
>>> > Subject: Re: mTLS on bmcweb
>>> >
>>> >
>>> >
>>> > On 4/23/20 7:35 PM, Richard Hanley wrote:
>>> > > My guess is that somehow the root cert used to validate clients
>>> isn't installed
>>> > correctly, and so it's defaulting to basic auth.
>>> > >
>>> > > At least that's my reading of this review
>>> > > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27270
>>> > >
>>> >
>>> > I think this would be the case. If the client certificate is not
>>> provided, TLS
>>> > connection is still established, just without authenticating the
>>> client. This
>>> > allows upper layer to provide other authentication methods (e.g. Basi=
c
>>> Auth).
>>> > >
>>> > > On Thu, Apr 23, 2020 at 9:47 AM Zhenfei Tai <ztai@google.com
>>> > <mailto:ztai@google.com>> wrote:
>>> > >
>>> > >     I guess part of my question is how to configure the mTLS certs
>>> to make
>>> > it work properly.
>>> > >
>>> > >     So far only https works (server side TLS).
>>> > >
>>> > >     Thanks,
>>> > >     Zhenfei
>>> > >
>>> > >     On Thu, Apr 23, 2020 at 8:50 AM Joseph Reynolds <
>>> jrey@linux.ibm.com
>>> > <mailto:jrey@linux.ibm.com>> wrote:
>>> > >
>>> > >         On 4/23/20 5:47 AM, P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC)=
 wrote:
>>> > >         > Hi,
>>> > >         >
>>> > >         > I encountered the same issue when using Redfish to replac=
e
>>> the
>>> > certificate.
>>> > >         > Regardless of whether the parameters include --cert --key
>>> > --cacert or only --cacert, the authentication can still succeed.
>>> > >         >
>>> > >         > Best,
>>> > >         > P.K.
>>> > >         >
>>> > >         >> Date: Wed, 22 Apr 2020 14:58:06 -0700
>>> > >         >> From: Zhenfei Tai <ztai@google.com
>>> > <mailto:ztai@google.com>>
>>> > >         >> To: openbmc@lists.ozlabs.org
>>> > <mailto:openbmc@lists.ozlabs.org>
>>> > >         >> Subject: mTLS on bmcweb
>>> > >         >> Message-ID:
>>> > >
>>> > >>      <CAMXw96Pp511sUO=3Dq1XLz2uJzh4S6D7tUwmkvpbnq_yU-iJfiKg@
>>> > mail.g
>>> > >         >> mail.com <http://mail.com>>
>>> > >         >> Content-Type: text/plain; charset=3D"utf-8"
>>> > >         >>
>>> > >         >> Hi,
>>> > >         >>
>>> > >         >> I'm trying out bmcweb mTLS which should be enabled by
>>> > default by
>>> > >         >>
>>> > https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L89
>>> > >         >>
>>> > >         >> In my test, I created a self signed key and certificate
>>> pair,
>>> > stacked them
>>> > >         >> up into server.pem in /etc/ssl/certs/https that bmcweb
>>> uses.
>>> > >         >>
>>> > >         >> However when I tried to curl bmcweb service, I was able
>>> to get
>>> > response by
>>> > >         >> only supplying the cert.
>>> > >         >>
>>> > >         >> curl --cacert cert.pem  https://${bmc}/redfish/v1
>>> > >         >>
>>> > >         >> With the mTLS enabled, I expected it should error out
>>> since no
>>> > client
>>> > >         >> certificate is provided.
>>> > >         >>
>>> >
>>> > As mentioned, if you did not provide a client certificate, connection
>>> was
>>> > established to allow for Basic Auth. And as the Service Root requires
>>> no
>>> > authentication, you got a response.
>>> >
>>> > - Wiktor
>>> >
>>> > >         >> Could someone with relevant knowledge help with my
>>> > question?
>>> > >
>>> > >         I'm not sure what you are asking.  Are you asking how to
>>> install
>>> > mTLS
>>> > >         certs into the BMC and then use them to connect?  I am stil=
l
>>> > waiting for
>>> > >         documentation that describes how to configure and use the
>>> mTLS
>>> > feature.
>>> > >
>>> > >         I've added an entry to the security working group as a
>>> reminder to
>>> > do
>>> > >         this.  (I don't have the skill to document this feature.)
>>> > >
>>> > >         - Joseph
>>> > >
>>> > >         >>
>>> > >         >> Thanks,
>>> > >         >> Zhenfei
>>> > >
>>>
>>

--00000000000022445105a48a946d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I did more testing and found the reason why it accepts any=
 client certification.<div>The error is due to the self signed certificate=
=C2=A0cannot be found in the list of trusted certificates.</div><div>Withou=
t the user defined verify callback function, it works as expected.</div><di=
v><br><table class=3D"gmail-memberdecls" style=3D"font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-stretch:normal;font-size:14px;line-h=
eight:19px;font-family:Roboto,sans-serif;border-spacing:0px;padding:0px;col=
or:rgb(0,0,0)"><tbody><tr class=3D"gmail-memitem:aa4f5a3309eae833f85dff37c3=
6fa039d"><td class=3D"gmail-memItemLeft" align=3D"right" valign=3D"top" sty=
le=3D"background-color:rgb(249,250,252);border:none;margin:4px;padding:1px =
0px 0px 8px;white-space:nowrap">#define=C2=A0</td><td class=3D"gmail-memIte=
mRight" valign=3D"bottom" style=3D"background-color:rgb(249,250,252);border=
:none;margin:4px;padding:1px 0px 0px 8px;width:1338px"><a class=3D"el" href=
=3D"https://docs.huihoo.com/doxygen/openssl/1.0.1c/crypto_2x509_2x509__vfy_=
8h.html#aa4f5a3309eae833f85dff37c36fa039d" style=3D"color:rgb(70,101,162);f=
ont-weight:bold">X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT</a>=C2=A0=C2=A0=C2=
=A018</td></tr></tbody></table><div><br></div><div><div style=3D"color:rgb(=
212,212,212);background-color:rgb(30,30,30);font-family:Menlo,Monaco,&quot;=
Courier New&quot;,monospace;font-size:12px;line-height:18px;white-space:pre=
"><div><span style=3D"color:rgb(106,153,85)">            // Check if certif=
icate is OK</span></div><div>            <span style=3D"color:rgb(86,156,21=
4)">int</span> error =3D <span style=3D"color:rgb(220,220,170)">X509_STORE_=
CTX_get_error</span>(cts);</div><div>            <span style=3D"color:rgb(1=
97,134,192)">if</span> (error !=3D X509_V_OK)</div><div>            {</div>=
<div>                <span style=3D"color:rgb(197,134,192)">return</span> <=
span style=3D"color:rgb(86,156,214)">true</span>;</div><div>            }</=
div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, Apr 30, 2020 at 12:09 PM Zhenfei Tai &lt;<a h=
ref=3D"mailto:ztai@google.com">ztai@google.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Also, with t=
hat change in http_connection.h, it still accepts any client certificate pr=
ovided in curl.<div><br></div><div>Here&#39;s what I did:</div><div>1. Disa=
ble=C2=A0BMCWEB_ENABLE_MUTUAL_TLS_AUTHENTICATION</div><div>2. Uncommented s=
sl_key_handler.hpp:315 and added the boost::asio::ssl::verify_fail_if_no_pe=
er_cert</div><div><br></div><div>Behavior after change:</div><div>1. Reject=
s curl without client certificate.</div><div>2. Returns when client certifi=
cate matches the one authority directory.</div><div>3. Rejects when client =
sends other=C2=A0certificates.=C2=A0</div><div><br></div><div>The change is=
 just for testing=C2=A0purposes, I guess the original intention was not to =
mTLS every request.</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Apr 30, 2020 at 11:34 AM Zhenfei Tai &lt;<=
a href=3D"mailto:ztai@google.com" target=3D"_blank">ztai@google.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">Hi P.K.<div><br></div><div>I tried the same thing.=C2=A0</div><div=
><br></div><div>Could you share which url you tested?</div><div>With that c=
hange, if I access the https://${bmc}/redfish/v1 url in chrome, it prompts =
to choose a client certificate, but will also work if no certificate is cho=
sen.</div><div><br>Thanks,</div><div>Zhenfei</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 30, 2020 at 6=
:27 AM P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) &lt;<a href=3D"mailto:P.K.Le=
e@quantatw.com" target=3D"_blank">P.K.Lee@quantatw.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">I found a way to fix =
this issue, but it needs to be modified to the source code. In two steps:<b=
r>
<br>
Step 1.<br>
The source code &quot;adaptor.set_verify_mode(boost::asio::ssl::verify_peer=
);&quot; in http_connection.h is replaced with <br>
&quot;adaptor.set_verify_mode(boost::asio::ssl::verify_peer | boost::asio::=
ssl::verify_fail_if_no_peer_cert);&quot;<br>
<br>
Step 2.<br>
AccountService-&gt;Oem-&gt;OpenBMC-&gt;AuthMethods-&gt;TLS is set. (false b=
y default)<br>
<br>
It will enable enforce mTLS authentication.<br>
<br>
Best,<br>
P.K.<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Wiktor Go=C5=82gowski &lt;<a href=3D"mailto:wiktor.golgowski@lin=
ux.intel.com" target=3D"_blank">wiktor.golgowski@linux.intel.com</a>&gt;<br=
>
&gt; Sent: Saturday, April 25, 2020 1:03 AM<br>
&gt; To: Richard Hanley &lt;<a href=3D"mailto:rhanley@google.com" target=3D=
"_blank">rhanley@google.com</a>&gt;; Zhenfei Tai &lt;<a href=3D"mailto:ztai=
@google.com" target=3D"_blank">ztai@google.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">open=
bmc@lists.ozlabs.org</a>; P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) &lt;<a hr=
ef=3D"mailto:P.K.Lee@quantatw.com" target=3D"_blank">P.K.Lee@quantatw.com</=
a>&gt;;<br>
&gt; <a href=3D"mailto:jrey@linux.ibm.com" target=3D"_blank">jrey@linux.ibm=
.com</a>; P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) &lt;<a href=3D"mailto:P.K=
.Lee@quantatw.com" target=3D"_blank">P.K.Lee@quantatw.com</a>&gt;; Joseph<b=
r>
&gt; Reynolds &lt;<a href=3D"mailto:jrey@linux.ibm.com" target=3D"_blank">j=
rey@linux.ibm.com</a>&gt;<br>
&gt; Subject: Re: mTLS on bmcweb<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On 4/23/20 7:35 PM, Richard Hanley wrote:<br>
&gt; &gt; My guess is that somehow the root cert used to validate clients i=
sn&#39;t installed<br>
&gt; correctly, and so it&#39;s defaulting to basic auth.<br>
&gt; &gt;<br>
&gt; &gt; At least that&#39;s my reading of this review<br>
&gt; &gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/=
27270" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.=
xyz/c/openbmc/bmcweb/+/27270</a><br>
&gt; &gt;<br>
&gt; <br>
&gt; I think this would be the case. If the client certificate is not provi=
ded, TLS<br>
&gt; connection is still established, just without authenticating the clien=
t. This<br>
&gt; allows upper layer to provide other authentication methods (e.g. Basic=
 Auth).<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Apr 23, 2020 at 9:47 AM Zhenfei Tai &lt;<a href=3D"mailto=
:ztai@google.com" target=3D"_blank">ztai@google.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:ztai@google.com" target=3D"_blank">ztai@g=
oogle.com</a>&gt;&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0I guess part of my question is how to configur=
e the mTLS certs to make<br>
&gt; it work properly.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0So far only https works (server side TLS).<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Zhenfei<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0On Thu, Apr 23, 2020 at 8:50 AM Joseph Reynold=
s &lt;<a href=3D"mailto:jrey@linux.ibm.com" target=3D"_blank">jrey@linux.ib=
m.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:jrey@linux.ibm.com" target=3D"_blank">jre=
y@linux.ibm.com</a>&gt;&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 4/23/20 5:47 AM, P. K. Lee (=
=E6=9D=8E=E6=9F=8F=E5=AF=AC) wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I encountered the same issu=
e when using Redfish to replace the<br>
&gt; certificate.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regardless of whether the p=
arameters include --cert --key<br>
&gt; --cacert or only --cacert, the authentication can still succeed.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Best,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; P.K.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Date: Wed, 22 Apr 2020 =
14:58:06 -0700<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; From: Zhenfei Tai &lt;<=
a href=3D"mailto:ztai@google.com" target=3D"_blank">ztai@google.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:ztai@google.com" target=3D"_blank">ztai@g=
oogle.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; To: <a href=3D"mailto:o=
penbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blan=
k">openbmc@lists.ozlabs.org</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Subject: mTLS on bmcweb=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Message-ID:<br>
&gt; &gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;CAMXw96Pp511sUO=3Dq1XLz2uJzh4S6D7tUwm=
kvpbnq_yU-iJfiKg@<br>
&gt; mail.g<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; <a href=3D"http://mail.=
com" rel=3D"noreferrer" target=3D"_blank">mail.com</a> &lt;<a href=3D"http:=
//mail.com" rel=3D"noreferrer" target=3D"_blank">http://mail.com</a>&gt;&gt=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Content-Type: text/plai=
n; charset=3D&quot;utf-8&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Hi,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; I&#39;m trying out bmcw=
eb mTLS which should be enabled by<br>
&gt; default by<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt; <a href=3D"https://github.com/openbmc/bmcweb/blob/master/CMakeLists.tx=
t#L89" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/bmcw=
eb/blob/master/CMakeLists.txt#L89</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; In my test, I created a=
 self signed key and certificate pair,<br>
&gt; stacked them<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; up into server.pem in /=
etc/ssl/certs/https that bmcweb uses.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; However when I tried to=
 curl bmcweb service, I was able to get<br>
&gt; response by<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; only supplying the cert=
.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; curl --cacert cert.pem=
=C2=A0 https://${bmc}/redfish/v1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; With the mTLS enabled, =
I expected it should error out since no<br>
&gt; client<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; certificate is provided=
.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt; <br>
&gt; As mentioned, if you did not provide a client certificate, connection =
was<br>
&gt; established to allow for Basic Auth. And as the Service Root requires =
no<br>
&gt; authentication, you got a response.<br>
&gt; <br>
&gt; - Wiktor<br>
&gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Could someone with rele=
vant knowledge help with my<br>
&gt; question?<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I&#39;m not sure what you are as=
king.=C2=A0 Are you asking how to install<br>
&gt; mTLS<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0certs into the BMC and then use =
them to connect?=C2=A0 I am still<br>
&gt; waiting for<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0documentation that describes how=
 to configure and use the mTLS<br>
&gt; feature.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I&#39;ve added an entry to the s=
ecurity working group as a reminder to<br>
&gt; do<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this.=C2=A0 (I don&#39;t have th=
e skill to document this feature.)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Joseph<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Thanks,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Zhenfei<br>
&gt; &gt;<br>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--00000000000022445105a48a946d--
