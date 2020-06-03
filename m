Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D5A1ED6EE
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 21:33:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cfG94nTTzDqhY
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 05:33:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ICIeV1lF; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cf5X4VhPzDqdv
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 05:25:51 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id h188so2050515lfd.7
 for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2020 12:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ulU3JvFsxfjTeVOfwFN42V3aPfq6UPsgNRhHTWW0Fo=;
 b=ICIeV1lFwBWeNWobbrHv75WDqiDGDVxSyxQMRBdrYr0np/BDId2PF3Xg6lL8+M9tIA
 xMwU5c7I1fEkK2cNKsjAHxkZunzFIRiFg/qxTRVlFKemC4Cy3c3OBtfy2feqdu1EkfdM
 R6bti0AljbcMaog2MivpUDfQl6a5l2M0ss6jLS1/0JUenEXY66aWJtbOxAEZ1ml14sCV
 B3ek/bEJNIqrxBJgyLlAwqHTrsR51Qi9b9T2PunD6b4UCSY7magWyRWAFgx36RbuyWs6
 OY5hgV1VhL5OA+5Vp9YxNI99ze590TVFlJW8vT9l9zQZvPOx/tk2dlLgVIguwAfIvNXi
 sUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ulU3JvFsxfjTeVOfwFN42V3aPfq6UPsgNRhHTWW0Fo=;
 b=ZcFAhVhCIBrX3VHPaiL+RH9cx6PkgSzt2DH1Kz0id1eX1ViFPqEgGwnr9zOMIC23zD
 n7GNSXGRaLE9xmOejL37GoVYzy6nqH/tiLsjd3fWk5OSrCazEetG/1bJoBI9OGjdvkfT
 N5Gz+dXaEPTe1S2Wyy42DckwWjvN5tNOmLH6ltHM7ysO7Q1ZQEiMbytE0CeidgUsRX1t
 PpIJ4VHRO/VodoQNbmAbMjbeBsX16EfeKmDzyzSIceWZxo1MoF34W0hid29y/OL9EThm
 DLio98nnz2rmlCT03EO135ZySAxs30dsNmt4qLSxS12Ek4AjlP1jD6x/HTxYfA6qtE2B
 Q26Q==
X-Gm-Message-State: AOAM5310fwrLJTxmEpClR5aZ4rm1vKvvuhUtHtHuxALHqcJzYQ0fyP/z
 PdU5J5RJkO22lYDbskHcer7gDmsCePD1T4HsXpGhiQ==
X-Google-Smtp-Source: ABdhPJzCrt80i+LoolOvOYmDuvPrFMK+yuE6Pnfyb1WBaTI1Y8XkDB5+DdPBU/YypklpE8rNUetKPTdpGv7XaCy6j5I=
X-Received: by 2002:ac2:5628:: with SMTP id b8mr522651lff.186.1591212346027;
 Wed, 03 Jun 2020 12:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <4c4aa12b1ffde80ebbf49ad78b6046889f4226c0.camel@fuzziesquirrel.com>
 <CAGm54UGorGfE-0FKj_+o3faU6sO-DW5jRoqPxFzx0VKwuD6Juw@mail.gmail.com>
 <CAPnigKku77Tc60TAAb_yTJaWNePYWM204BF8erJS7CjhxrAPRA@mail.gmail.com>
 <20200602230639.GK17541@heinlein> <20200603000702.GC7478@mauery.jf.intel.com>
 <2673E963-830B-410C-BE4D-18807CDF93F4@fb.com>
 <41f9a41f-1681-54be-2cb5-dc71e86829f7@intel.com>
In-Reply-To: <41f9a41f-1681-54be-2cb5-dc71e86829f7@intel.com>
From: William Kennington <wak@google.com>
Date: Wed, 3 Jun 2020 12:25:34 -0700
Message-ID: <CAPnigKnAytWQP0LjujX0MvG2JZCxYjth3RSYScYYGjshxCYBgg@mail.gmail.com>
Subject: Re: OpenBMC Logging and Error Handling Dos and Don'ts
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Content-Type: multipart/alternative; boundary="000000000000a639ae05a732fe3a"
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a639ae05a732fe3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The local process always emits all logs generated by phosphor-logging, it
is up to the journald configuration what levels are used for different
things.
https://www.freedesktop.org/software/systemd/man/journald.conf.html

You can change the priority level output by journalctl on the command line
too, to filter out lower priority messages.
`journal -p err` or some other level

On Wed, Jun 3, 2020 at 12:18 PM Johnathan Mantey <
johnathanx.mantey@intel.com> wrote:

> I would like it to be easier to determine how to change the error message
> level.
> I don't bother with the log code because I don't know where it's
> controlled.
>
> On 6/3/20 12:02 PM, Vijay Khemka wrote:
>
> =EF=BB=BFOn 6/2/20, 5:08 PM, "openbmc on behalf of Vernon Mauery" <openbm=
c-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of vernon.mauery@=
linux.intel.com> <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.orgonbe=
halfofvernon.mauery@linux.intel.com> wrote:
>
>     On 02-Jun-2020 06:06 PM, Patrick Williams wrote:
>     >On Mon, Jun 01, 2020 at 11:07:46PM -0700, William Kennington wrote:
>     >> If you use the fmt library it would only require one extra tempora=
ry string
>     >> to be constructed and it works trivially with something like phosp=
hor
>     >> logging.
>     >>
>     >> log<level::INFO>(fmt::format("My error: {}", filename));
>     >>
>     >> It also has the advantage of understanding basic c++ types like
>     >> std::strings and std::string_views.
>     >>
>     >> On Mon, Jun 1, 2020 at 8:33 PM =E9=83=81=E9=9B=B7 <yulei.sh@byteda=
nce.com> <yulei.sh@bytedance.com> wrote:
>     >>
>     >> > I have a bit concern about this. The existing phosphor-logging A=
PI
>     >> > does not support this well.
>     >> > Specifically, it does not support the "printf" way to generate a
>     >> > string with the variables to log.
>     >> > So previously we typically put the variables in entries.
>     >> > I do agree that logging the variables in the MESSAGE field is mu=
ch better.
>     >> > But to encourage such logging, the logging API should be enhance=
d to
>     >> > support the "printf" way.
>     >> > E.g.
>     >> >     log<level::INFO>("Something is wrong: %s:%d", xx, xxx);
>     >> > is much better than:
>     >> >     std::string to_log =3D xxx; // generate the message manually
>     >> >     log<level::INFO>(to_log);
>     >> >
>     >> > Otherwise, it's really not convenient to write such logging code=
.
>     >> >
>     >
>     >Separate from this proposal from Brad, I'd like to work on a
>     >next-generation of phosphor-logging.  When we originally implemented
>     >phosphor-logging we were all pretty new to C++14.  I think there can=
 be
>     >some great improvement in the syntax of phosphor-logging now that we
>     >have C++17 (and more experience).
>     >
>     >The biggest change I'd like to do is in the way the structured entri=
es
>     >are defined, but I think we can improve the verbosity of syntax in
>     >making a log in general.
>
>     One more change I would like to see is a way to actually have the rea=
l
>     filename and line number show up in the systemd log. Right now the
>     filename and line number are always the logger code:
>         CODE_LINE=3D76
>         CODE_FUNC=3Dhelper_log
>         CODE_FILE=3D.../usr/include/phosphor-logging/log.hpp
>
> It will be good if we can have debug as a level and somehow we can see
> messages from debug by enabling or disabling.
>
>     It looks like C++20 has a shiny new helper for this: source_location
>     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__en.cppreferenc=
e.com_w_cpp_experimental_source-5Flocation&d=3DDwIFaQ&c=3D5VD0RTtNlTh3ycd41=
b3MUw&r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=3DqFbu7FdFQSHVMy4Zv=
MtHDH5RzYQnqMUQ_T0h4qL0Xd0&s=3DQRsbQvb4LKAEoa8AITFyPFhcoCSVHtFLMOU66UodPnM&=
e=3D
>
>     --Vernon
>
>     >Some example syntax:
>     >
>     >// Current syntax (and I'm being especially verbose on the namespace=
s).
>     >phosphor::logging::log<phosphor::logging::level::ERR>("Some message"=
,
>     >    phosphor::logging::entry("EXAMPLE=3D%s"), example_str);
>     >
>     >// Potential syntax
>     >lg::error("Some message", "EXAMPLE"_s, example_str);
>     >
>     >In a code-review I was on, we had some discussions about how difficu=
lt
>     >it is to create data that isn't in the "-o verbose" and I think Will=
iam
>     >and Lei are both referring to that as well.  I am concerned that a
>     >generic format leads us more to unstructured logging, which personal=
ly I
>     >don't like.  My suggestion is that we have some easy syntax to indic=
ate
>     >"also put this structured data into the raw message" so that my exam=
ple
>     >above the message becomes "Some message. EXAMPLE=3D'the string'".
>     >
>     >I'd be interested to hear what "next generation logging" others have=
 in
>     >mind.
>     >
>     >--
>     >Patrick Williams
>
>
>
>
>
> --
> Johnathan Mantey
> Senior Software Engineer
> *azad te**chnology partners*
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com
>
>

--000000000000a639ae05a732fe3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The local process always emits all logs generated by phosp=
hor-logging, it is up to the journald configuration what levels are used fo=
r different things.<div><a href=3D"https://www.freedesktop.org/software/sys=
temd/man/journald.conf.html">https://www.freedesktop.org/software/systemd/m=
an/journald.conf.html</a><br></div><div><br></div><div>You can change the p=
riority level output by journalctl on the command line too, to filter out l=
ower priority messages.</div><div>`journal -p err` or some other level</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed, Jun 3, 2020 at 12:18 PM Johnathan Mantey &lt;<a href=3D"mailto:joh=
nathanx.mantey@intel.com">johnathanx.mantey@intel.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    I would like it to be easier to determine how to change the error
    message level.<br>
    I don&#39;t bother with the log code because I don&#39;t know where it&=
#39;s
    controlled.<br>
    <br>
    <div>On 6/3/20 12:02 PM, Vijay Khemka wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>=EF=BB=BFOn 6/2/20, 5:08 PM, &quot;openbmc on behalf of Vernon M=
auery&quot; <a href=3D"mailto:openbmc-bounces+vijaykhemka=3Dfb.com@lists.oz=
labs.orgonbehalfofvernon.mauery@linux.intel.com" target=3D"_blank">&lt;open=
bmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of vernon.mauer=
y@linux.intel.com&gt;</a> wrote:

    On 02-Jun-2020 06:06 PM, Patrick Williams wrote:
    &gt;On Mon, Jun 01, 2020 at 11:07:46PM -0700, William Kennington wrote:
    &gt;&gt; If you use the fmt library it would only require one extra tem=
porary string
    &gt;&gt; to be constructed and it works trivially with something like p=
hosphor
    &gt;&gt; logging.
    &gt;&gt;
    &gt;&gt; log&lt;level::INFO&gt;(fmt::format(&quot;My error: {}&quot;, f=
ilename));
    &gt;&gt;
    &gt;&gt; It also has the advantage of understanding basic c++ types lik=
e
    &gt;&gt; std::strings and std::string_views.
    &gt;&gt;
    &gt;&gt; On Mon, Jun 1, 2020 at 8:33 PM =E9=83=81=E9=9B=B7 <a href=3D"m=
ailto:yulei.sh@bytedance.com" target=3D"_blank">&lt;yulei.sh@bytedance.com&=
gt;</a> wrote:
    &gt;&gt;
    &gt;&gt; &gt; I have a bit concern about this. The existing phosphor-lo=
gging API
    &gt;&gt; &gt; does not support this well.
    &gt;&gt; &gt; Specifically, it does not support the &quot;printf&quot; =
way to generate a
    &gt;&gt; &gt; string with the variables to log.
    &gt;&gt; &gt; So previously we typically put the variables in entries.
    &gt;&gt; &gt; I do agree that logging the variables in the MESSAGE fiel=
d is much better.
    &gt;&gt; &gt; But to encourage such logging, the logging API should be =
enhanced to
    &gt;&gt; &gt; support the &quot;printf&quot; way.
    &gt;&gt; &gt; E.g.
    &gt;&gt; &gt;     log&lt;level::INFO&gt;(&quot;Something is wrong: %s:%=
d&quot;, xx, xxx);
    &gt;&gt; &gt; is much better than:
    &gt;&gt; &gt;     std::string to_log =3D xxx; // generate the message m=
anually
    &gt;&gt; &gt;     log&lt;level::INFO&gt;(to_log);
    &gt;&gt; &gt;
    &gt;&gt; &gt; Otherwise, it&#39;s really not convenient to write such l=
ogging code.
    &gt;&gt; &gt;
    &gt;
    &gt;Separate from this proposal from Brad, I&#39;d like to work on a
    &gt;next-generation of phosphor-logging.  When we originally implemente=
d
    &gt;phosphor-logging we were all pretty new to C++14.  I think there ca=
n be
    &gt;some great improvement in the syntax of phosphor-logging now that w=
e
    &gt;have C++17 (and more experience).
    &gt;
    &gt;The biggest change I&#39;d like to do is in the way the structured =
entries
    &gt;are defined, but I think we can improve the verbosity of syntax in
    &gt;making a log in general.

    One more change I would like to see is a way to actually have the real=
=20
    filename and line number show up in the systemd log. Right now the=20
    filename and line number are always the logger code:
        CODE_LINE=3D76
        CODE_FUNC=3Dhelper_log
        CODE_FILE=3D.../usr/include/phosphor-logging/log.hpp

It will be good if we can have debug as a level and somehow we can see
messages from debug by enabling or disabling.

    It looks like C++20 has a shiny new helper for this: source_location
    <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__en.cp=
preference.com_w_cpp_experimental_source-5Flocation&amp;d=3DDwIFaQ&amp;c=3D=
5VD0RTtNlTh3ycd41b3MUw&amp;r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&=
amp;m=3DqFbu7FdFQSHVMy4ZvMtHDH5RzYQnqMUQ_T0h4qL0Xd0&amp;s=3DQRsbQvb4LKAEoa8=
AITFyPFhcoCSVHtFLMOU66UodPnM&amp;e=3D" target=3D"_blank">https://urldefense=
.proofpoint.com/v2/url?u=3Dhttps-3A__en.cppreference.com_w_cpp_experimental=
_source-5Flocation&amp;d=3DDwIFaQ&amp;c=3D5VD0RTtNlTh3ycd41b3MUw&amp;r=3Dv9=
MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&amp;m=3DqFbu7FdFQSHVMy4ZvMtHDH5Rz=
YQnqMUQ_T0h4qL0Xd0&amp;s=3DQRsbQvb4LKAEoa8AITFyPFhcoCSVHtFLMOU66UodPnM&amp;=
e=3D</a>=20

    --Vernon

    &gt;Some example syntax:
    &gt;
    &gt;// Current syntax (and I&#39;m being especially verbose on the name=
spaces).
    &gt;phosphor::logging::log&lt;phosphor::logging::level::ERR&gt;(&quot;S=
ome message&quot;,
    &gt;    phosphor::logging::entry(&quot;EXAMPLE=3D%s&quot;), example_str=
);
    &gt;
    &gt;// Potential syntax
    &gt;lg::error(&quot;Some message&quot;, &quot;EXAMPLE&quot;_s, example_=
str);
    &gt;
    &gt;In a code-review I was on, we had some discussions about how diffic=
ult
    &gt;it is to create data that isn&#39;t in the &quot;-o verbose&quot; a=
nd I think William
    &gt;and Lei are both referring to that as well.  I am concerned that a
    &gt;generic format leads us more to unstructured logging, which persona=
lly I
    &gt;don&#39;t like.  My suggestion is that we have some easy syntax to =
indicate
    &gt;&quot;also put this structured data into the raw message&quot; so t=
hat my example
    &gt;above the message becomes &quot;Some message. EXAMPLE=3D&#39;the st=
ring&#39;&quot;.
    &gt;
    &gt;I&#39;d be interested to hear what &quot;next generation logging&qu=
ot; others have in
    &gt;mind.
    &gt;
    &gt;--=20
    &gt;Patrick Williams



</pre>
    </blockquote>
    <br>
    <div>-- <br>
     =20
     =20
      <font color=3D"#1F497D"><font face=3D"Century Gothic">Johnathan Mante=
y<br>
          <small>Senior Software Engineer</small><br>
          <big><font color=3D"#555555"><small><b>azad te</b><b>chnology
                  partners</b></small><br>
              <small><font color=3D"#1F497D"><small>Contributing to
                    Technology Innovation since 1992</small></font><small><=
br>
                  <font color=3D"#1F497D">Phone: <a href=3D"tel:(503)%20712=
-6764" value=3D"+15037126764" target=3D"_blank">(503) 712-6764</a><br>
                    Email: <a href=3D"mailto:johnathanx.mantey@intel.com" t=
arget=3D"_blank">johnathanx.mantey@intel.com</a></font></small><br>
                <br>
              </small></font></big></font></font> </div>
  </div>

</blockquote></div>

--000000000000a639ae05a732fe3a--
