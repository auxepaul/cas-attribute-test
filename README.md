#cas-attribute-test
==================

Sample CAS project that demonstrates how to retrieve attributes per service from LDAP

## Changes to `deployerContextConfig.xml` 

### `UsernamePasswordCredentialsToPrincipalResolver` bean

```XML
<bean class="org.jasig.cas.authentication.principal.UsernamePasswordCredentialsToPrincipalResolver">
  <property name="attributeRepository" ref="attributeRepository"/>	
</bean>
```
### `attributeRepository` bean
```XML
<bean id="attributeRepository" class="org.jasig.services.persondir.support.ldap.LdapPersonAttributeDao">
  <property name="baseDN" value="ou=people,dc=uni,dc=edu"/>
  <property name="requireAllQueryAttributes" value="true"/>
  <property name="queryAttributeMapping">
  <map>
    <entry key="username" value="uid"/>
  </map>
  </property>
  <property name="contextSource" ref="contextSource"/>
  <property name="resultAttributeMapping">
  <map>
    <entry key="uid" value="uid" />
    <entry key="displayName" value="displayName" />
  </map>
  </property>
</bean>
```